#
# Makefile for contents in www/status
#
include ../../JM.rules

ifndef WORKDIR
	WORKDIR = /var/tmp/JM
endif

ifndef DATE
	DATE := $(shell env LANG=C date +"%Y%m%d")
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

