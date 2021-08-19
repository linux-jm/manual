PACKAGE_NAME = util-linux
man_numbers = 1 3 5 8

THRESH = 0
EXTFLAGS =
PO4AFLAGS += -M UTF-8 -k $(THRESH) $(EXTFLAGS)
LANGS = ja

target-mans = $(addprefix man,$(man_numbers))
po_dirs     = $(addprefix po4a/,$(target-mans))
po_files    = $(addsuffix /ja.po,$(po_dirs))

all:	translate
translate: $(target-mans)
$(target-mans): man%:
	po4a $(PO4AFLAGS) -v --variable langs='$(LANGS)' \
	  --previous po4a/man$*/$(PACKAGE_NAME)-man$*.cfg

stat:
	@for po in $(po_files); do \
	  echo -n $$po": "; \
	  msgfmt --statistics -o /dev/null $$po; \
	done
