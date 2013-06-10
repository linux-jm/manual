THRESH = 100
EXTFLAGS =
PO4AFLAGS += -k $(THRESH) $(EXTFLAGS)

MASTER_CMD = $(wildcard original/man[^23]/*.[1-8])
MASTER_LIB = $(wildcard original/man[23]/*.[1-8])
MASTER_ROFFS = $(MASTER_CMD) $(MASTER_LIB)
TRANS_ROFFS = $(patsubst original/%,draft/%,$(MASTER_ROFFS))
POFILES = $(wildcard po4a/*/*.ja.po)
POTFILES = $(wildcard po4a/*/*.pot)
MSGMERGE_OPTS = --no-wrap --no-location

WORK_DIR = .

all:	translate
cmd:	translate-cmd
lib:	translate-lib

translate:	translate-cmd translate-lib
translate-cmd:	$(patsubst %,_translate-%,$(notdir $(MASTER_CMD)))
translate-lib:	$(patsubst %,_translate-%,$(notdir $(MASTER_LIB)))

_translate-%:
	@set -e; for target in $*; do \
	  echo $$target; \
	  p=$$(echo $* | sed -e 's|.*\.\([1-8]\)|man\1/\0|'); \
	  pofile=po4a/$$p.ja.po; \
	  potfile=po4a/$$p.pot; \
	  master=original/$$p; \
	  trans=draft/$$p; \
	  addendum=po4a/add_ja/copyright/$(notdir $*).txt; \
	  mkdir -p $$(dirname $$master); \
	  if sed -e '1,3!d' $$master | grep -q '^\.so '; then \
	    echo "Skip link file $$master"; \
	  else \
	    po4a-translate $(PO4AFLAGS) -f man -p $$pofile -l $$trans -m $$master \
	      --addendum $$addendum; \
	  fi; \
	done

updatepo:	$(patsubst %,_updatepo-%,$(notdir $(MASTER_ROFFS)))

_updatepo-%:
	@set -e; for target in $*; do \
	  p=$$(echo $* | sed -e 's|.*\.\([1-8]\)|man\1/\0|'); \
	  pofile=po4a/$$p.ja.po; \
	  potfile=po4a/$$p.pot; \
	  master=original/$$p; \
	  if sed -e '1,3!d' $$master | grep -q '^\.so '; then \
	    echo "Skip link file $$master"; \
	  elif [ -f $$pofile ]; then \
	    echo -n "po4a-updatepo $$pofile <- $$master"; \
	    po4a-updatepo -f man --previous --msgmerge-opt='$(MSGMERGE_OPTS)' \
	      -p $$pofile -m $$master; \
	  else \
	    echo -n "po4a-gettextize $$pofile <- $$master"; \
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

pot:	$(patsubst %,_pot-%,$(notdir $(MASTER_ROFFS)))

_pot-%:
	@set -e; for target in $*; do \
	  p=$$(echo $* | sed -e 's|.*\.\([1-8]\)|man\1/\0|'); \
	  pofile=po4a/$$p.ja.po; \
	  potfile=po4a/$$p.pot; \
	  master=original/$$p; \
	  if sed -e '1,3!d' $$master | grep -q '^\.so '; then \
	    echo "Skip link file $$master"; \
	  else \
	    echo "po4a-gettextize $$potfile <- $$master"; \
	    po4a-gettextize -f man -p $$potfile -m $$master; \
	  fi; \
	done

pot-clean:
	$(RM) -v $(POTFILES)
