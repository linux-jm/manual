THRESH = 100
EXTFLAGS =
PO4AFLAGS += -k $(THRESH) $(EXTFLAGS)

LANGS = ja

PACKAGE = iptables
PO4A_SUBDIRS = cmd lib

WORK_DIR = .

all:	translate

translate: $(patsubst %, translate-%, $(PO4A_SUBDIRS))

translate-%:
	po4a $(PO4AFLAGS) -v --variable langs='$(LANGS)' \
	  --previous --srcdir $(WORK_DIR) --destdir $(WORK_DIR) \
	  po4a/$*/$(PACKAGE)-$*.cfg

stats:	$(patsubst %, stat-%, $(PO4A_SUBDIRS))

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
