/* Copyright (C) 1995, 1997, 1998, 2001 Free Software Foundation, Inc.
   This file is part of the GNU C Library.
   Contributed by Ulrich Drepper <drepper@gnu.ai.mit.edu <mailto:drepper@gnu.ai.mit.edu>>, August 1995.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

#include <stdlib.h>

/* libc_hidden_proto(nrand48_r) */

/* libc_hidden_proto(lrand48_r) */
int lrand48_r (struct drand48_data *buffer, long int *result)
{
    /* Be generous for the arguments, detect some errors.  */
    if (buffer == NULL)
	return -1;

    return nrand48_r (buffer->__x, buffer, result);
}
libc_hidden_def(lrand48_r)
