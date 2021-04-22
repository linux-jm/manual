THRESH = 80
EXTFLAGS =
PO4AFLAGS += -k $(THRESH) $(EXTFLAGS)

MASTER_CMD = $(wildcard original/man[^23]/*.[1-8])
MASTER_LIB = $(wildcard original/man[23]/*.[1-8])
MASTER_ROFFS = $(MASTER_CMD) $(MASTER_LIB)
TRANS_ROFFS = $(patsubst original/%,draft/%,$(MASTER_ROFFS))
POFILES = $(sort $(wildcard po4a/*/*.ja.po))
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
	@PO4AFLAGS="$(PO4AFLAGS)" ./tools/translate.sh $*

updatepo:	$(patsubst %,_updatepo-%,$(notdir $(MASTER_ROFFS)))

_updatepo-%:
	@MSGMERGE_OPTS="$(MSGMERGE_OPTS)" ./tools/updatepo.sh $*

stat:
	@for po in $(POFILES); do \
	  echo -n $$(basename $$po)": "; \
	  msgfmt --statistics -o /dev/null $$po; \
	done

pot:	$(patsubst %,_pot-%,$(notdir $(MASTER_ROFFS)))

_pot-%:
	@./tools/generatepot.sh $*

pot-clean:
	$(RM) -v $(POTFILES)
