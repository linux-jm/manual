#
# Makefile for contents in www/status
# $Id: Makefile,v 1.1 2002/09/14 07:51:59 nakano Exp $
#
include ../../JM.rules

ifndef WORKDIR
	WORKDIR = /var/tmp/JM
endif

ifndef DATE
	DATE := $(shell date +"%Y%m%d")
endif

.SUFFIXES: .m4 .html

index.html: index.m4 ../bin/link-rpms.perl
	m4 -P -D _WORKDIR=$(WORKDIR) -D _WWWROOT=$(WWWROOT) \
	 -D _DATE=$(DATE) $*.m4 | nkf -j > $*.html

all: index.html

*.html: ../jm_www.m4

clean:
	@rm -f index.html

install: all

