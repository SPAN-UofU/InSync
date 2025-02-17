/*
 * Syscalls for uClibc
 *
 * Copyright (C) 2000-2006 Erik Andersen <andersen@uclibc.org>
 *
 * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
 */
/* Extracted from ../common/syscalls.c by Erik Andersen <andersen@codepoet.org>
 * Adapted to FR-V by Alexandre Oliva <aoliva@redhat.com>
 */

#include <sys/syscall.h>
#include <unistd.h>
#include <sys/stat.h>

/* libc_hidden_proto(fstat) */
_syscall2(int, fstat, int, fd, struct stat *, buf)
libc_hidden_def(fstat)
