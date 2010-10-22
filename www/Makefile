#
# Makefile for contents in www
# $Id: Makefile,v 1.27 2007/10/28 17:27:13 jm Exp $
#
include ../JM.rules

ifndef WORKDIR
	WORKDIR = /var/tmp/JM
endif

ifndef DATE
	DATE := $(shell date +"%Y%m%d")
endif

.SUFFIXES: .m4 .html

.m4.html:
	m4 -P -D _WORKDIR=$(WORKDIR) $*.m4 | cat -s | nkf -j > $*.html

CONTENTS = index.html download.html section.html copyright.html \
	README.html INSTALL.html \
	missing.html nosuchpage.html manerror.html mail_error.html \
	news.html news2001.html news2000.html news1999.html \
	news2002.html news2003.html news2004.html news2005.html news2006.html
#
# rules
#
all: contents
	make -C INDEX/
	make -C guidance/ WWWROOT=$(WWWROOT)
	make -C man-ja/
	make -C rpm/ DATE=$(DATE)
	make -C announcement/

contents: $(CONTENTS)

*.html: jm_www.m4

index.html: news.m4 ../latest-archive-modified

README.html: ../dist/README

INSTALL.html: ../dist/INSTALL

../dist/README ../dist/INSTALL:
	$(MAKE) -C .. -f Makefile.dist

download.html: download.m4 ../latest-archive-modified 
	m4 -P -D _WORKDIR=$(WORKDIR) -D _DATE=$(DATE) $< | nkf -j > $@

../latest-archive-modified:
	make -C .. latest-archive-modified

clean:
	@rm -f $(CONTENTS) *.tar.gz
	-$(RM) -rf per-pkg/
	-$(RM) -f rpm/*.rpm rpm/index.html
	make -C INDEX/ clean
	make -C guidance/ clean
	make -C man-ja/ clean
	make -C announcement/ clean

install: all
	$(MAKE) -C guidance  WWWROOT=$(WWWROOT) install
	$(RSYNC) -a -v \
	--exclude='bin' \
	--exclude='*.m4' \
	--exclude='*.perl' \
	--exclude='*.list' \
	--exclude='Makefile' \
	--exclude='ChangeLog' \
	. $(WWWROOT)

