THRESH = 100
EXTFLAGS =
PO4AFLAGS += -k $(THRESH) $(EXTFLAGS)

LANGS = ja

PACKAGE = cups
#PO4A_SUBDIRS = lp.1 lpr.1
PO4A_SUBDIRS = $(wildcard po4a/*)

WORK_DIR = .

all:	translate

translate: $(patsubst po4a/%, translate-%, $(PO4A_SUBDIRS))

# This target is to escape "add_*" directory in po4a.
translate-add_%:
	@:

translate-%:
	po4a $(PO4AFLAGS) -v --variable langs='$(LANGS)' \
	  --previous --srcdir $(WORK_DIR) --destdir $(WORK_DIR) \
	  po4a/$*/po4a.cfg

stats:	$(patsubst po4a/%, stat-%, $(PO4A_SUBDIRS))

stat-%:
	@for l in $(LANGS); do \
	  echo -n "$*($$l): "; \
	  msgfmt --statistics -o /dev/null po4a/$*/$$l.po; \
	done

page-stat:
	@LC_ALL=C po4a $(PO4AFLAGS) --force -v -k 0 --variable langs='$(LANGS)' \
	  --previous --srcdir $(WORK_DIR) --destdir $(WORK_DIR) $(PO4ACFG) | \
	  grep translated | \
	  sed -e 's/(\([1-9][0-9]*\) strings)/(\1 of \1 strings)/' \
	      -e 's/[()]//g' \
	      -e 's/^draft\/man[1-9]\///' | \
	  awk '{printf("%-15s: %7s (%3s/%3s)\n",$$1,$$3,$$5,$$7);}'
