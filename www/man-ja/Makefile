#
# Makefile for contents in www/status
# $Id: Makefile,v 1.1 1999/10/04 15:31:59 nakano Exp $
#
include ../../JM.rules

ifndef WORKDIR
WORKDIR         = /var/tmp/JM
endif

.SUFFIXES: .m4 .html

.m4.html:
	m4 -P -D _WORKDIR=$(WORKDIR) -D _WWWROOT=$(WWWROOT) $*.m4\
	| nkf -j > $*.html

all: index.html man-pager.html

*.html: ../jm_www.m4

clean:
	@rm -f index.html man-pager.html

install: all

