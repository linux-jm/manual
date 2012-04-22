PERKAMON_DIR = perkamon
LANGS = ja
THRESH = 100
FLAGS ?=
PO4AFLAGS ?= -k $(THRESH) $(FLAGS)

all: translate

translate: jm-setup
	cd perkamon && $(MAKE) translate PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)"

translate-%: jm-setup
	cd perkamon && $(MAKE) translate-$* PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)"

stats:	jm-setup
	cd perkamon && $(MAKE) stats PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)"

jm-setup:
	# Create symlink to po4a/*/po in the top dir.
	@set -e; for d in $(PERKAMON_DIR)/po4a/*; do \
	  if [ ! -e $$d/po ]; then \
	    t=$$(echo $$d | sed -e "s|$(PERKAMON_DIR)/||"); \
	    ln -s ../../../$$t/po $$d/po; \
	  fi; \
	done
