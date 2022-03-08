PACKAGE_NAME = asymptote
man_numbers = 1

THRESH = 100
EXTFLAGS =
PO4AFLAGS += -k $(THRESH) $(EXTFLAGS)

target-mans = $(addprefix man,$(man_numbers))
po_dirs     = $(addprefix po4a/,$(target-mans))
po_files    = $(addsuffix /ja.po,$(po_dirs))

all: translate

translate: $(target-mans)

$(target-mans): man%:
	po4a $(PO4AFLAGS) po4a/man$*/$(PACKAGE_NAME)-man$*.cfg

stat:
	@for po in $(po_files); do \
	  msgfmt -v --statistics -o /dev/null $$po; \
	done

page-stat:
	@for n in $(man_numbers); do \
	  if test -f po4a/man$$n/$(PACKAGE_NAME)-man$$n.cfg; then \
	    echo po4a/man$$n/$(PACKAGE_NAME)-man$$n.cfg: ;\
	    po4a --force --no-update -k 0 po4a/man$$n/$(PACKAGE_NAME)-man$$n.cfg | \
	      sed "s/^/  /g" ;\
	  fi \
	done

.PHONY: all translate stat page-stat
