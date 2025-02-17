/* vi: set sw=4 ts=4: */
/*
 * alarm() for uClibc
 *
 * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
 *
 * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
 */

#include <sys/syscall.h>
#include <unistd.h>

/* libc_hidden_proto(alarm) */

#ifdef __NR_alarm
_syscall1(unsigned int, alarm, unsigned int, seconds)
#else
#include <sys/time.h>

/* libc_hidden_proto(setitimer) */

unsigned int alarm(unsigned int seconds)
{
	struct itimerval old, new;
	unsigned int retval;

	new.it_value.tv_usec = 0;
	new.it_interval.tv_sec = 0;
	new.it_interval.tv_usec = 0;
	new.it_value.tv_sec = (long int) seconds;
	if (setitimer(ITIMER_REAL, &new, &old) < 0) {
		return 0;
	}
	retval = old.it_value.tv_sec;
	if (old.it_value.tv_usec) {
		++retval;
	}
	return retval;
}
#endif
libc_hidden_def(alarm)
