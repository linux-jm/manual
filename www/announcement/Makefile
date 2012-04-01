#
# Makefile for contents in www/announcement.
#

OBJS = index.html 19991015.html 20001120.html

.SUFFIXES: .m4 .html

.m4.html:
	m4 -P $*.m4 | nkf -w > $*.html

default: $(OBJS)

*.html: ../jm_www.m4

index.html: index.m4

19991015.html: 19991015.euc

20001120.html: 20001120.euc

clean:
	rm -f $(OBJS)
