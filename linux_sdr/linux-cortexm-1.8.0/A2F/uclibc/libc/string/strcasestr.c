/*
 * Copyright (C) 2002     Manuel Novoa III
 * Copyright (C) 2000-2005 Erik Andersen <andersen@uclibc.org>
 *
 * Licensed under the LGPL v2.1, see the file COPYING.LIB in this tarball.
 */

#include "_string.h"
#include <ctype.h>

#ifdef __UCLIBC_HAS_XLOCALE__
/* libc_hidden_proto(__ctype_tolower_loc) */
#elif defined __UCLIBC_HAS_CTYPE_TABLES__
/* libc_hidden_proto(__ctype_tolower) */
#endif
/* libc_hidden_proto(tolower) */

char *strcasestr(const char *s1, const char *s2)
{
	register const char *s = s1;
	register const char *p = s2;

#if 1
	do {
		if (!*p) {
			return (char *) s1;;
		}
		if ((*p == *s)
			|| (tolower(*((unsigned char *)p)) == tolower(*((unsigned char *)s)))
			) {
			++p;
			++s;
		} else {
			p = s2;
			if (!*s) {
				return NULL;
			}
			s = ++s1;
		}
	} while (1);
#else
	while (*p && *s) {
		if ((*p == *s)
			|| (tolower(*((unsigned char *)p)) == tolower(*((unsigned char *)s)))
			) {
			++p;
			++s;
		} else {
			p = s2;
			s = ++s1;
		}
	}

	return (*p) ? NULL : (char *) s1;
#endif
}
libc_hidden_def(strcasestr)
