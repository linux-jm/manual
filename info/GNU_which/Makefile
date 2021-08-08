PACKAGE_NAME      = which
FULL_PACKAGE_NAME = GNU which
PACKAGE_VERSION   = 2.21

texi_source_main  = \
	$(PACKAGE_NAME).texi
texi_source_others = \
	version.texi

THRESH = 0
EXTFLAGS =
LANGS = ja
PO4ACFG = po4a/texi/$(PACKAGE_NAME)-texi.cfg
PO4AFLAGS += -M UTF-8 -k $(THRESH) $(EXTFLAGS)
WORK_DIR = .

include ../build-aux/po4a-texi.mk
