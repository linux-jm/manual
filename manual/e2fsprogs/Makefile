THRETH = 50
EXTFLAGS =
PO4AFLAGS += -k $(THRETH) $(EXTFLAGS)

LANGS = ja
PO4ACFG = po4a/e2fsprogs.cfg

WORK_DIR = .

all:	translate

translate:
	po4a $(PO4AFLAGS) -v --variable langs='$(LANGS)' \
	  --previous --srcdir $(WORK_DIR) --destdir $(WORK_DIR) $(PO4ACFG)

force:
	po4a --force $(PO4AFLAGS) $(PO4ACFG)

stat:
	msgfmt --statistics -o /dev/null po4a/ja.po

page-stat:
	@LC_ALL=C po4a $(PO4AFLAGS) --force -v -k 0 --variable langs='$(LANGS)' \
	  --previous --srcdir $(WORK_DIR) --destdir $(WORK_DIR) $(PO4ACFG) | \
	  grep translated | \
	  sed -e 's/(\([1-9][0-9]*\) strings)/(\1 of \1 strings)/' \
	      -e 's/[()]//g' \
	      -e 's/^draft\/man[1-9]\///' | \
	  awk '{printf("%-15s: %7s (%3s/%3s)\n",$$1,$$3,$$5,$$7);}'
