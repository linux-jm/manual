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

CONTENTS = index.html section.html copyright.html \
	README.html INSTALL.html
#
# rules
#
all: contents
	make -C INDEX/
	make -C man-ja/
	make -C announcement/
	make -C news/

contents: $(CONTENTS)

*.html: jm_www.m4

index.html: news/index.m4 ../stamp/latest-archive-modified

README.html: ../dist/README

INSTALL.html: ../dist/INSTALL

../dist/README ../dist/INSTALL:
	$(MAKE) -C .. -f Makefile.dist

../stamp/latest-archive-modified:
	make -C .. stamp/latest-archive-modified

clean:
	@rm -f $(CONTENTS) *.tar.gz
	-$(RM) -rf per-pkg/
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
