#
# Makefile for contents in www/status
#
include ../../JM.rules

ifndef WORKDIR
WORKDIR         = /var/tmp/JM
endif

INDICES = ldp.html linux.html gnu.html misc.html pod.html progress.html 
.SUFFIXES: .m4 .html

.m4.html:
	m4 -P -D _WORKDIR=$(WORKDIR) -D _WWWROOT=$(WWWROOT) $*.m4\
	| nkf -w > $*.html

all: index.html

index.html: $(INDICES)

ldp.html: ../bin/list_ldp.perl

gnu.html: ../bin/list.perl gnu.list

linux.html: ../bin/list.perl linux.list

misc.html: ../bin/list.perl misc.list

pod.html: ../bin/list_pod.perl pod.list

progress.html: ../bin/list_progress.perl

*.html: ../jm_www.m4 ../../stamp/cvs-status-modified

../../stamp/cvs-status-modified:
	make -C ../.. chkcvs

clean:
	rm -f index.html ldp.html linux.html gnu.html misc.html pod.html progress.html

install: all

