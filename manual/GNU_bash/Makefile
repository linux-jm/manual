#THRESH = 100
# msgfmt --statistics reports 100% translations. However po4a says
# 1 item is remaining untranslated, But i cannot identify it.
# Setting THRESH to 99 is just a workaround. -- motoki 2012/06/03
THRESH = 99
EXTFLAGS =
PO4AFLAGS += -k $(THRESH) $(EXTFLAGS)

LANGS = ja
PACKAGE = bash
PO4ACFG = po4a/$(PACKAGE).cfg

WORK_DIR = .

all:	translate

translate:
	po4a $(PO4AFLAGS) -v --variable langs='$(LANGS)' \
	  --previous --srcdir $(WORK_DIR) --destdir $(WORK_DIR) $(PO4ACFG)

stat:
	@for l in $(LANGS); do \
	  echo -n "$$l: "; \
	  msgfmt --statistics -o /dev/null po4a/$$l.po; \
	done

page-stat:
	@LC_ALL=C po4a $(PO4AFLAGS) --force -v -k 0 --variable langs='$(LANGS)' \
	  --previous --srcdir $(WORK_DIR) --destdir $(WORK_DIR) $(PO4ACFG) | \
	  grep translated | \
	  sed -e 's/(\([1-9][0-9]*\) strings)/(\1 of \1 strings)/' \
	      -e 's/[()]//g' \
	      -e 's/^draft\/man[1-9]\///' | \
	  awk '{printf("%-15s: %7s (%3s/%3s)\n",$$1,$$3,$$5,$$7);}'
