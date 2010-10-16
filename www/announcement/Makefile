#
# Makefile for contents in www/announcement.
# $Id: Makefile,v 1.3 2001/12/22 04:02:57 nakano Exp $
#

OBJS = index.html 19991015.html 20001120.html

.SUFFIXES: .m4 .html

.m4.html:
	m4 -P $*.m4 | nkf -j > $*.html

default: $(OBJS)

*.html: ../jm_www.m4

index.html: index.m4

19991015.html: 19991015.euc

20001120.html: 20001120.euc

clean:
	rm -f $(OBJS)
