THRESH = 100
EXTFLAGS =
PO4AFLAGS += -k $(THRESH) $(EXTFLAGS)

LANGS = ja
PO4ACFG = po4a/coreutils.cfg

WORK_DIR = .

all:	translate

translate:
	po4a $(PO4AFLAGS) --variable langs='$(LANGS)' --previous --srcdir $(WORK_DIR) --destdir $(WORK_DIR) $(PO4ACFG)