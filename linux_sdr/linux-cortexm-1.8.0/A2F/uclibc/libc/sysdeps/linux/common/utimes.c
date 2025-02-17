/* vi: set sw=4 ts=4: */
/*
 * utimes() for uClibc
 *
 * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
 *
 * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
 */

#include <sys/syscall.h>
#include <utime.h>
#include <sys/time.h>

/* libc_hidden_proto(utimes) */

#ifdef __NR_utimes
_syscall2(int, utimes, const char *, file, const struct timeval *, tvp)
#else
#include <stdlib.h>

/* libc_hidden_proto(utime) */

int utimes(const char *file, const struct timeval tvp[2])
{
	struct utimbuf buf, *times;

	if (tvp) {
		times = &buf;
		times->actime = tvp[0].tv_sec;
		times->modtime = tvp[1].tv_sec;
	} else {
		times = NULL;
	}
	return utime(file, times);
}
#endif
link_warning(utimes, "the use of LEGACY `utimes' is discouraged, use `utime'")
libc_hidden_def(utimes)
