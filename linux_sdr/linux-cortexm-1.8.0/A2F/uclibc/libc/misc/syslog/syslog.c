/*
 * Copyright (c) 1983, 1988, 1993
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
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by the University of
 *	California, Berkeley and its contributors.
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
 * SYSLOG -- print message on log file
 *
 * This routine looks a lot like printf, except that it outputs to the
 * log file instead of the standard output.  Also:
 *	adds a timestamp,
 *	prints the module name in front of the message,
 *	has some other formatting types (or will sometime),
 *	adds a newline on the end of the message.
 *
 * The output of this routine is intended to be read by syslogd(8).
 *
 * Author: Eric Allman
 * Modified to use UNIX domain IPC by Ralph Campbell
 * Patched March 12, 1996 by A. Ian Vogelesang <vogelesang@hdshq.com>
 *  - to correct the handling of message & format string truncation,
 *  - to visibly tag truncated records to facilitate
 *    investigation of such Bad Things with grep, and,
 *  - to correct the handling of case where "write"
 *    returns after writing only part of the message.
 * Rewritten by Martin Mares <mj@atrey.karlin.mff.cuni.cz> on May 14, 1997
 *  - better buffer overrun checks.
 *  - special handling of "%m" removed as we use GNU sprintf which handles
 *    it automatically.
 *  - Major code cleanup.
 */

#define __FORCE_GLIBC
#include <features.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/file.h>
#include <sys/signal.h>
#include <sys/syslog.h>

#include <sys/uio.h>
#include <sys/wait.h>
#include <netdb.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <errno.h>
#include <stdarg.h>
#include <paths.h>
#include <stdio.h>
#include <ctype.h>
#include <signal.h>

/* libc_hidden_proto(openlog) */
/* libc_hidden_proto(syslog) */
/* libc_hidden_proto(vsyslog) */
/* libc_hidden_proto(closelog) */

/* Experimentally off - libc_hidden_proto(memset) */
/* Experimentally off - libc_hidden_proto(memcpy) */
/* Experimentally off - libc_hidden_proto(memmove) */
/* Experimentally off - libc_hidden_proto(strchr) */
/* Experimentally off - libc_hidden_proto(strlen) */
/* Experimentally off - libc_hidden_proto(strncpy) */
/* libc_hidden_proto(open) */
/* libc_hidden_proto(fcntl) */
/* libc_hidden_proto(socket) */
/* libc_hidden_proto(close) */
/* libc_hidden_proto(write) */
/* libc_hidden_proto(getpid) */
/* libc_hidden_proto(ctime) */
/* libc_hidden_proto(sigaction) */
/* libc_hidden_proto(sigemptyset) */
/* libc_hidden_proto(connect) */
/* libc_hidden_proto(sprintf) */
/* libc_hidden_proto(vsnprintf) */
/* Experimentally off - libc_hidden_proto(time) */

#include <bits/uClibc_mutex.h>
__UCLIBC_MUTEX_STATIC(mylock, PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP);


static int       LogFile = -1;          /* fd for log */
static smalluint connected;             /* have done connect */
/* all bits in option argument for openlog() fit in 8 bits */
static smalluint LogStat = 0;           /* status bits, set by openlog() */
static const char *LogTag = "syslog";   /* string to tag the entry with */
/* this fits in 8 bits too (LOG_LOCAL7 = 23<<3 = 184),
 * but NB: LOG_FACMASK is bigger (= 0x03f8 = 127<<3) for some strange reason.
 * Oh well. */
static int       LogFacility = LOG_USER;/* default facility code */
/* bits mask of priorities (eight prios - 8 bits is enough) */
static smalluint LogMask = 0xff;        /* mask of priorities to be logged */
/* AF_UNIX address of local logger (we use struct sockaddr
 * instead of struct sockaddr_un since "/dev/log" is small enough) */
static const struct sockaddr SyslogAddr = {
	.sa_family = AF_UNIX, /* sa_family_t (usually a short) */
	.sa_data = _PATH_LOG  /* char [14] */
};

static void
closelog_intern(int sig)
{
	/* mylock must be held by the caller */
	if (LogFile != -1) {
		(void) close(LogFile);
	}
	LogFile = -1;
	connected = 0;
	if (sig == 0) { /* called from closelog()? - reset to defaults */
		LogStat = 0;
		LogTag = "syslog";
		LogFacility = LOG_USER;
		LogMask = 0xff;
	}
}

/*
 * OPENLOG -- open system log
 */
void
openlog(const char *ident, int logstat, int logfac)
{
	int logType = SOCK_DGRAM;

	__UCLIBC_MUTEX_LOCK(mylock);

	if (ident != NULL)
		LogTag = ident;
	LogStat = logstat;
	if (logfac != 0 && (logfac &~ LOG_FACMASK) == 0)
		LogFacility = logfac;
	if (LogFile == -1) {
retry:
		if (LogStat & LOG_NDELAY) {
			if ((LogFile = socket(AF_UNIX, logType, 0)) == -1) {
				goto DONE;
			}
			fcntl(LogFile, F_SETFD, 1); /* 1 == FD_CLOEXEC */
			/* We don't want to block if e.g. syslogd is SIGSTOPed */
			fcntl(LogFile, F_SETFL, O_NONBLOCK | fcntl(LogFile, F_GETFL));
		}
	}

	if (LogFile != -1 && !connected) {
		if (connect(LogFile, &SyslogAddr, sizeof(SyslogAddr)) != -1) {
			connected = 1;
		} else {
			if (LogFile != -1) {
				close(LogFile);
				LogFile = -1;
			}
			if (logType == SOCK_DGRAM) {
				logType = SOCK_STREAM;
				goto retry;
			}
		}
	}

DONE:
	__UCLIBC_MUTEX_UNLOCK(mylock);
}
libc_hidden_def(openlog)

/*
 * syslog, vsyslog --
 *     print message on log file; output is intended for syslogd(8).
 */
void
vsyslog(int pri, const char *fmt, va_list ap)
{
	register char *p;
	char *last_chr, *head_end, *end, *stdp;
	time_t now;
	int fd, saved_errno;
	int rc;
	char tbuf[1024]; /* syslogd is unable to handle longer messages */
	struct sigaction action, oldaction;

	memset(&action, 0, sizeof(action));
	action.sa_handler = closelog_intern;
	sigaction(SIGPIPE, &action, &oldaction);

	saved_errno = errno;

	__UCLIBC_MUTEX_LOCK(mylock);

	/* See if we should just throw out this message. */
	if (!(LogMask & LOG_MASK(LOG_PRI(pri))) || (pri &~ (LOG_PRIMASK|LOG_FACMASK)))
		goto getout;
	if (LogFile < 0 || !connected)
		openlog(LogTag, LogStat | LOG_NDELAY, 0);

	/* Set default facility if none specified. */
	if ((pri & LOG_FACMASK) == 0)
		pri |= LogFacility;

	/* Build the message. We know the starting part of the message can take
	 * no longer than 64 characters plus length of the LogTag. So it's
	 * safe to test only LogTag and use normal sprintf everywhere else.
	 */
	(void)time(&now);
	stdp = p = tbuf + sprintf(tbuf, "<%d>%.15s ", pri, ctime(&now) + 4);
	if (LogTag) {
		if (strlen(LogTag) < sizeof(tbuf) - 64)
			p += sprintf(p, "%s", LogTag);
		else
			p += sprintf(p, "<BUFFER OVERRUN ATTEMPT>");
	}
	if (LogStat & LOG_PID)
		p += sprintf(p, "[%d]", getpid());
	if (LogTag) {
		*p++ = ':';
		*p++ = ' ';
	}
	head_end = p;

	/* We format the rest of the message. If the buffer becomes full, we mark
	 * the message as truncated. Note that we require at least 2 free bytes
	 * in the buffer as we might want to add "\r\n" there.
	 */

	end = tbuf + sizeof(tbuf) - 1;
	__set_errno(saved_errno);
	p += vsnprintf(p, end - p, fmt, ap);
	if (p >= end || p < head_end) {	/* Returned -1 in case of error... */
		static const char truncate_msg[12] = "[truncated] "; /* no NUL! */
		memmove(head_end + sizeof(truncate_msg), head_end,
				end - head_end - sizeof(truncate_msg));
		memcpy(head_end, truncate_msg, sizeof(truncate_msg));
		if (p < head_end) {
			while (p < end && *p) {
				p++;
			}
		}
		else {
			p = end - 1;
		}

	}
	last_chr = p;

	/* Output to stderr if requested. */
	if (LogStat & LOG_PERROR) {
		*last_chr = '\n';
		(void)write(STDERR_FILENO, stdp, last_chr - stdp + 1);
	}

	/* Output the message to the local logger using NUL as a message delimiter. */
	p = tbuf;
	*last_chr = 0;
	if (LogFile >= 0) {
		do {
			rc = write(LogFile, p, last_chr + 1 - p);
			if (rc < 0) {
				/* I don't think looping forever on EAGAIN is a good idea.
				 * Imagine that syslogd is SIGSTOPed... */
				if (/* (errno != EAGAIN) && */ (errno != EINTR)) {
					closelog_intern(1); /* 1: do not reset LogXXX globals to default */
					goto write_err;
				}
				rc = 0;
			}
			p += rc;
		} while (p <= last_chr);
		goto getout;
	}

 write_err:
	/*
	 * Output the message to the console; don't worry about blocking,
	 * if console blocks everything will.  Make sure the error reported
	 * is the one from the syslogd failure.
	 */
	/* should mode be O_WRONLY | O_NOCTTY? -- Uli */
	/* yes, but in Linux "/dev/console" never becomes ctty anyway -- vda */
	if ((LogStat & LOG_CONS) &&
	    (fd = open(_PATH_CONSOLE, O_WRONLY | O_NOCTTY)) >= 0) {
		p = strchr(tbuf, '>') + 1;
		last_chr[0] = '\r';
		last_chr[1] = '\n';
		(void)write(fd, p, last_chr - p + 2);
		(void)close(fd);
	}

getout:
	__UCLIBC_MUTEX_UNLOCK(mylock);
	sigaction(SIGPIPE, &oldaction, NULL);
}
libc_hidden_def(vsyslog)

void
syslog(int pri, const char *fmt, ...)
{
	va_list ap;

	va_start(ap, fmt);
	vsyslog(pri, fmt, ap);
	va_end(ap);
}
libc_hidden_def(syslog)

/*
 * CLOSELOG -- close the system log
 */
void
closelog(void)
{
	__UCLIBC_MUTEX_LOCK(mylock);
	closelog_intern(0); /* 0: reset LogXXX globals to default */
	__UCLIBC_MUTEX_UNLOCK(mylock);
}
libc_hidden_def(closelog)

/* setlogmask -- set the log mask level */
int setlogmask(int pmask)
{
	int omask;

	omask = LogMask;
	if (pmask != 0) {
		__UCLIBC_MUTEX_LOCK(mylock);
		LogMask = pmask;
		__UCLIBC_MUTEX_UNLOCK(mylock);
	}
	return omask;
}
