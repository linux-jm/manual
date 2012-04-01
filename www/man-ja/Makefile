#
# Makefile for contents in www/status
#
include ../../JM.rules

ifndef WORKDIR
WORKDIR         = /var/tmp/JM
endif

.SUFFIXES: .m4 .html

.m4.html:
	m4 -P -D _WORKDIR=$(WORKDIR) -D _WWWROOT=$(WWWROOT) $*.m4\
	| nkf -w > $*.html

all: index.html man-pager.html

*.html: ../jm_www.m4

clean:
	@rm -f index.html man-pager.html

install: all

