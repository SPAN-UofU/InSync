/*
 * Copyright (c) 1983 Regents of the University of California.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms are permitted
 * provided that the above copyright notice and this paragraph are
 * duplicated in all such forms and that any documentation,
 * advertising materials, and other materials related to such
 * distribution and use acknowledge that the software was developed
 * by the University of California, Berkeley.  The name of the
 * University may not be used to endorse or promote products derived
 * from this software without specific prior written permission.
 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
 * WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * This is derived from the Berkeley source:
 *	@(#)random.c	5.5 (Berkeley) 7/6/88
 * It was reworked for the GNU C Library by Roland McGrath.
 * Rewritten to use reentrant functions by Ulrich Drepper, 1995.
 */

#include <features.h>
#include <limits.h>
#include <stddef.h>
#include <stdlib.h>

/* libc_hidden_proto(random_r) */
/* libc_hidden_proto(srandom_r) */
/* libc_hidden_proto(setstate_r) */
/* libc_hidden_proto(initstate_r) */

/* POSIX.1c requires that there is mutual exclusion for the `rand' and
   `srand' functions to prevent concurrent calls from modifying common
   data.  */
#include <bits/uClibc_mutex.h>
__UCLIBC_MUTEX_STATIC(mylock, PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP);


/* An improved random number generation package.  In addition to the standard
   rand()/srand() like interface, this package also has a special state info
   interface.  The initstate() routine is called with a seed, an array of
   bytes, and a count of how many bytes are being passed in; this array is
   then initialized to contain information for random number generation with
   that much state information.  Good sizes for the amount of state
   information are 32, 64, 128, and 256 bytes.  The state can be switched by
   calling the setstate() function with the same array as was initialized
   with initstate().  By default, the package runs with 128 bytes of state
   information and generates far better random numbers than a linear
   congruential generator.  If the amount of state information is less than
   32 bytes, a simple linear congruential R.N.G. is used.  Internally, the
   state information is treated as an array of longs; the zeroth element of
   the array is the type of R.N.G. being used (small integer); the remainder
   of the array is the state information for the R.N.G.  Thus, 32 bytes of
   state information will give 7 longs worth of state information, which will
   allow a degree seven polynomial.  (Note: The zeroth word of state
   information also has some other information stored in it; see setstate
   for details).  The random number generation technique is a linear feedback
   shift register approach, employing trinomials (since there are fewer terms
   to sum up that way).  In this approach, the least significant bit of all
   the numbers in the state table will act as a linear feedback shift register,
   and will have period 2^deg - 1 (where deg is the degree of the polynomial
   being used, assuming that the polynomial is irreducible and primitive).
   The higher order bits will have longer periods, since their values are
   also influenced by pseudo-random carries out of the lower bits.  The
   total period of the generator is approximately deg*(2**deg - 1); thus
   doubling the amount of state information has a vast influence on the
   period of the generator.  Note: The deg*(2**deg - 1) is an approximation
   only good for large deg, when the period of the shift register is the
   dominant factor.  With deg equal to seven, the period is actually much
   longer than the 7*(2**7 - 1) predicted by this formula.  */



/* Keep constants in sync with random_r.c */

/* Linear congruential.  */
#define	TYPE_0		0
#define	BREAK_0		8
#define	DEG_0		0
#define	SEP_0		0

/* x**7 + x**3 + 1.  */
#define	TYPE_1		1
#define	BREAK_1		32
#define	DEG_1		7
#define	SEP_1		3

/* x**15 + x + 1.  */
#define	TYPE_2		2
#define	BREAK_2		64
#define	DEG_2		15
#define	SEP_2		1

/* x**31 + x**3 + 1.  */
#define	TYPE_3		3
#define	BREAK_3		128
#define	DEG_3		31
#define	SEP_3		3

/* x**63 + x + 1.  */
#define	TYPE_4		4
#define	BREAK_4		256
#define	DEG_4		63
#define	SEP_4		1

#define	MAX_TYPES	5	/* Max number of types above.  */

/* Initially, everything is set up as if from:
	initstate(1, randtbl, 128);
   Note that this initialization takes advantage of the fact that srandom
   advances the front and rear pointers 10*rand_deg times, and hence the
   rear pointer which starts at 0 will also end up at zero; thus the zeroth
   element of the state information, which contains info about the current
   position of the rear pointer is just
	(MAX_TYPES * (rptr - state)) + TYPE_3 == TYPE_3.  */

static int32_t randtbl[DEG_3 + 1] =
{
    TYPE_3,

    -1726662223, 379960547, 1735697613, 1040273694, 1313901226,
    1627687941, -179304937, -2073333483, 1780058412, -1989503057,
    -615974602, 344556628, 939512070, -1249116260, 1507946756,
    -812545463, 154635395, 1388815473, -1926676823, 525320961,
    -1009028674, 968117788, -123449607, 1284210865, 435012392,
    -2017506339, -911064859, -370259173, 1132637927, 1398500161,
    -205601318,
};


static struct random_data unsafe_state =
{
    /* FPTR and RPTR are two pointers into the state info, a front and a rear
       pointer.  These two pointers are always rand_sep places aparts, as they
       cycle through the state information.  (Yes, this does mean we could get
       away with just one pointer, but the code for random is more efficient
       this way).  The pointers are left positioned as they would be from the call:
       initstate(1, randtbl, 128);
       (The position of the rear pointer, rptr, is really 0 (as explained above
       in the initialization of randtbl) because the state table pointer is set
       to point to randtbl[1] (as explained below).)  */

    fptr : &randtbl[SEP_3 + 1],
    rptr : &randtbl[1],

    /* The following things are the pointer to the state information table,
       the type of the current generator, the degree of the current polynomial
       being used, and the separation between the two pointers.
       Note that for efficiency of random, we remember the first location of
       the state information, not the zeroth.  Hence it is valid to access
       state[-1], which is used to store the type of the R.N.G.
       Also, we remember the last location, since this is more efficient than
       indexing every time to find the address of the last element to see if
       the front and rear pointers have wrapped.  */

    state : &randtbl[1],

    rand_type : TYPE_3,
    rand_deg : DEG_3,
    rand_sep : SEP_3,

    end_ptr : &randtbl[sizeof (randtbl) / sizeof (randtbl[0])]
};


/* Initialize the random number generator based on the given seed.  If the
   type is the trivial no-state-information type, just remember the seed.
   Otherwise, initializes state[] based on the given "seed" via a linear
   congruential generator.  Then, the pointers are set to known locations
   that are exactly rand_sep places apart.  Lastly, it cycles the state
   information a given number of times to get rid of any initial dependencies
   introduced by the L.C.R.N.G.  Note that the initialization of randtbl[]
   for default usage relies on values produced by this routine.  */
void srandom (unsigned int x)
{
    __UCLIBC_MUTEX_LOCK(mylock);
    srandom_r (x, &unsafe_state);
    __UCLIBC_MUTEX_UNLOCK(mylock);
}
strong_alias(srandom,srand)

/* Initialize the state information in the given array of N bytes for
   future random number generation.  Based on the number of bytes we
   are given, and the break values for the different R.N.G.'s, we choose
   the best (largest) one we can and set things up for it.  srandom is
   then called to initialize the state information.  Note that on return
   from srandom, we set state[-1] to be the type multiplexed with the current
   value of the rear pointer; this is so successive calls to initstate won't
   lose this information and will be able to restart with setstate.
   Note: The first thing we do is save the current state, if any, just like
   setstate so that it doesn't matter when initstate is called.
   Returns a pointer to the old state.  */
char * initstate (unsigned int seed, char *arg_state, size_t n)
{
    int32_t *ostate;

    __UCLIBC_MUTEX_LOCK(mylock);
    ostate = &unsafe_state.state[-1];
    initstate_r (seed, arg_state, n, &unsafe_state);
    __UCLIBC_MUTEX_UNLOCK(mylock);
    return (char *) ostate;
}

/* Restore the state from the given state array.
   Note: It is important that we also remember the locations of the pointers
   in the current state information, and restore the locations of the pointers
   from the old state information.  This is done by multiplexing the pointer
   location into the zeroth word of the state information. Note that due
   to the order in which things are done, it is OK to call setstate with the
   same state as the current state
   Returns a pointer to the old state information.  */
char * setstate (char *arg_state)
{
    int32_t *ostate;

    __UCLIBC_MUTEX_LOCK(mylock);
    ostate = &unsafe_state.state[-1];
    if (setstate_r (arg_state, &unsafe_state) < 0)
	ostate = NULL;
    __UCLIBC_MUTEX_UNLOCK(mylock);
    return (char *) ostate;
}

/* If we are using the trivial TYPE_0 R.N.G., just do the old linear
   congruential bit.  Otherwise, we do our fancy trinomial stuff, which is the
   same in all the other cases due to all the global variables that have been
   set up.  The basic operation is to add the number at the rear pointer into
   the one at the front pointer.  Then both pointers are advanced to the next
   location cyclically in the table.  The value returned is the sum generated,
   reduced to 31 bits by throwing away the "least random" low bit.
   Note: The code takes advantage of the fact that both the front and
   rear pointers can't wrap on the same call by not testing the rear
   pointer if the front one has wrapped.  Returns a 31-bit random number.  */

/* libc_hidden_proto(random) */
long int random (void)
{
  int32_t retval;

  __UCLIBC_MUTEX_LOCK(mylock);
  random_r (&unsafe_state, &retval);
  __UCLIBC_MUTEX_UNLOCK(mylock);
  return retval;
}
libc_hidden_def(random)
