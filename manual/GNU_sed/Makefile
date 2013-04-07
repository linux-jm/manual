THRESH = 100
EXTFLAGS =
PO4AFLAGS += -k $(THRESH) $(EXTFLAGS)

MASTER_ROFFS = $(wildcard original/*/*.[1-8])
TRANS_ROFFS = $(patsubst original/%,draft/%,$(MASTER_ROFFS))
POFILES = $(patsubst original/%,po4a/%.ja.po,$(MASTER_ROFFS))
POTFILES = $(patsubst original/%,po4a/%.pot,$(MASTER_ROFFS))
MSGMERGE_OPTS = --no-wrap --no-location

WORK_DIR = .

all:	translate

translate:	$(TRANS_ROFFS)

draft/%:	po4a/%.ja.po
	po4a-translate $(PO4AFLAGS) -f man -p $< -l $@ -m original/$* \
	  --addendum po4a/add_ja/copyright/$(notdir $*).txt

updatepo:	$(patsubst %,updatepo-%,$(notdir $(MASTER_ROFFS)))

updatepo-%:
	@set -e; for target in $*; do \
	  p=$$(echo $* | sed -e 's|.*\.\([1-8]\)|man\1/\0|'); \
	  pofile=po4a/$$p.ja.po; \
	  potfile=po4a/$$p.pot; \
	  master=original/$$p; \
	  if [ -f $$pofile ]; then \
	    echo "po4a-updatepo $$pofile <- $$master"; \
	    po4a-updatepo -f man --previous --msgmerge-opt='$(MSGMERGE_OPTS)' \
	      -p $$pofile -m $$master; \
	  else \
	    echo "po4a-gettextize $$pofile <- $$master"; \
	    mkdir -p $$(dirname $$pofile); \
	    po4a-gettextize -f man -p $$pofile -m $$master; \
	    cp $$pofile $$potfile; \
	    msgmerge $(MSGMERGE_OPTS) -o $$pofile $$pofile $$potfile; \
	    $(RM) $$potfile; \
	  fi; \
	done

stat:
	@for po in $(POFILES); do \
	  echo -n $$(basename $$po)": "; \
	  msgfmt --statistics -o /dev/null $$po; \
	done

pot:	$(POTFILES)

po4a/%.pot:
	po4a-gettextize -f man -p $@ -m original/$*

pot-clean:
	$(RM) -v $(POTFILES)
