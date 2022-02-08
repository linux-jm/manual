PACKAGE_NAME = man-db

THRESH = 0
EXTFLAGS =
PO4AFLAGS += -k $(THRESH) $(EXTFLAGS)
PO4ACFG = $(PACKAGE_NAME).cfg
POFILE  = po4a/man/ja.po

all: manpages

translate: po4a
	@echo To generate manpages, issue \"make manpages\".

po4a:
	cd po4a/man; po4a $(PO4AFLAGS) $(PO4ACFG)

stat:
	@msgfmt -v --statistics -o /dev/null $(POFILE)

page-stat:
	@echo $(POFILE):
	@(cd po4a/man; po4a --force --no-update -k 0 $(PO4ACFG))

manpages: po4a
	@if test ! -f upstream.mk; then \
	  echo Not found upstream.mk.                          ;\
	  echo Without it you can get only *.man1/5/8 pages    ;\
	  echo instead of truely *.1/5/8 manpages.             ;\
	  echo This is explained in the original/gettext.txt   ;\
	  echo which leads you to execute original/gettext.sh. ;\
	  exit 1 ;\
	fi
	@$(MAKE) -s DESTDIR=release -f upstream.mk install-man

.PHONY: translate po4a stat page-stat manpages
