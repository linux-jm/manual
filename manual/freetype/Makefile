PACKAGE_NAME = freetype

THRESH = 100
EXTFLAGS =
PO4AFLAGS += -k $(THRESH) $(EXTFLAGS)
PO4ACFG = po4a/$(PACKAGE_NAME).cfg
POFILE  = po4a/ja.po

all: translate

translate:
	po4a $(PO4AFLAGS) $(PO4ACFG)

stat:
	@msgfmt -v --statistics -o /dev/null $(POFILE)

page-stat:
	@echo $(POFILE):
	@po4a --force --no-update -k 0 $(PO4ACFG)

.PHONY: translate stat page-stat
