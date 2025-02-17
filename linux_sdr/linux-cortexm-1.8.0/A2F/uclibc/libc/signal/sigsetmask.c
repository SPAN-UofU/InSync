/* Copyright (C) 1991,1994-1997,2001-2002 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

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

#define __UCLIBC_HIDE_DEPRECATED__
#include <errno.h>
#include <signal.h>
#include <string.h>

/* libc_hidden_proto(sigprocmask) */

#include "sigset-cvt-mask.h"

/* Set the mask of blocked signals to MASK, returning the old mask.  */
/* libc_hidden_proto(sigsetmask) */
int
sigsetmask (int mask)
{
  sigset_t set, oset;

  sigset_set_old_mask (&set, mask);
  sigprocmask (SIG_SETMASK, &set, &oset); /* can't fail */
  return sigset_get_old_mask (&oset);
}
libc_hidden_def(sigsetmask)
