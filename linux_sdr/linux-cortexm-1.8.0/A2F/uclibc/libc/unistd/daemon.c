/* vi: set sw=4 ts=4: */
/* daemon implementation for uClibc
 *
 * Copyright (c) 1990, 1993
 *	The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * 3. <BSD Advertising Clause omitted per the July 22, 1999 licensing change
 *		ftp://ftp.cs.berkeley.edu/pub/4bsd/README.Impt.License.Change>
 *
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

/*
 * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
 *
 * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
 * Modified for uClibc by Erik Andersen <andersen@uclibc.org>
 */

#include <stdio.h>
#include <features.h>
#include <fcntl.h>
#include <paths.h>
#include <signal.h>
#include <unistd.h>

#if defined __USE_BSD || (defined __USE_XOPEN && !defined __USE_UNIX98)

/* libc_hidden_proto(open) */
/* libc_hidden_proto(close) */
/* libc_hidden_proto(_exit) */
/* libc_hidden_proto(dup2) */
/* libc_hidden_proto(setsid) */
/* libc_hidden_proto(chdir) */
/* libc_hidden_proto(fork) */

#ifndef __ARCH_USE_MMU__
#include <sys/syscall.h>
#include <sched.h>
/* use clone() to get fork() like behavior here -- we just want to disassociate
 * from the controlling terminal
 */
static inline pid_t _fork_parent(void)
{
	register unsigned long ret = INTERNAL_SYSCALL(clone, wtf, 2, CLONE_VM, 0);
	if (ret != -1 && ret != 0)
		/* parent needs to die now w/out touching stack */
		INTERNAL_SYSCALL(exit, wtf, 0);
	return ret;
}
static inline pid_t fork_parent(void)
{
	/* Block all signals to keep the parent from using the stack */
	pid_t ret;
	sigset_t new_set, old_set;
	sigfillset(&new_set);
	sigprocmask(SIG_BLOCK, &new_set, &old_set);
	ret = _fork_parent();
	sigprocmask(SIG_SETMASK, &old_set, NULL);
	return ret;
}
#else
static inline pid_t fork_parent(void)
{
	switch (fork()) {
		case -1: return -1;
		case 0:  return 0;
		default: _exit(0);
	}
}
#endif

int daemon( int nochdir, int noclose )
{
	int fd;

	if (fork_parent() == -1)
		return -1;

	if (setsid() == -1)
		return(-1);

	if (!nochdir)
		chdir("/");

	if (!noclose && (fd = open(_PATH_DEVNULL, O_RDWR, 0)) != -1) {
		dup2(fd, STDIN_FILENO);
		dup2(fd, STDOUT_FILENO);
		dup2(fd, STDERR_FILENO);
		if (fd > 2)
			close(fd);
	}
	return(0);
}
#endif
