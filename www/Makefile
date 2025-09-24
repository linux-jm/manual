#
# Makefile for contents in www
#
include ../JM.rules

ifndef WORKDIR
	WORKDIR = /var/tmp/JM
endif

ifndef DATE
	DATE := $(shell env LANG=C date +"%Y%m%d")
endif

.SUFFIXES: .m4 .html

.m4.html:
	m4 -P -D _WORKDIR=$(WORKDIR) $*.m4 | cat -s | nkf -w > $*.html

CONTENTS = index.html download.html section.html copyright.html \
	README.html INSTALL.html
#
# rules
#
all: contents
	make -C INDEX/
	make -C man-ja/
	make -C rpm/ DATE=$(DATE)
	make -C announcement/
	make -C news/

contents: $(CONTENTS)

*.html: jm_www.m4

index.html: news/index.m4 ../stamp/latest-archive-modified

README.html: ../dist/README

INSTALL.html: ../dist/INSTALL

../dist/README ../dist/INSTALL:
	$(MAKE) -C .. -f Makefile.dist

download.html: download.m4 ../stamp/latest-archive-modified ../stamp/www-info-modified
	m4 -P -D _WORKDIR=$(WORKDIR) -D _DATE=$(DATE) $< | nkf -w > $@

../stamp/latest-archive-modified:
	make -C .. stamp/latest-archive-modified

clean:
	@rm -f $(CONTENTS) *.tar.gz
	-$(RM) -rf per-pkg/
	-$(RM) -f rpm/*.rpm rpm/index.html
	make -C INDEX/ clean
	make -C man-ja/ clean
	make -C announcement/ clean

install: all
	$(RSYNC) -a --delete --omit-dir-times -v \
	--exclude='bin' \
	--exclude='*.m4' \
	--exclude='*.perl' \
	--exclude='*.list' \
	--exclude='Makefile' \
	--exclude='ChangeLog' \
	--exclude='.gitignore' \
	* .htaccess $(WWWROOT)
#	$(MAKE) -C ../admin/site WWWROOT=$(WWWROOT) install
