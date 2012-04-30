PERKAMON_DIR = perkamon
LANGS = ja
THRESH = 100
FLAGS ?=
PO4AFLAGS ?= -k $(THRESH) $(FLAGS)

all: translate

translate: jm-setup
	LC_ALL=C $(MAKE) translate \
	  PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)" -C $(PERKAMON_DIR) \
	  | tee untrans.txt
	./untrans-list.pl < untrans.txt > untrans.html

translate-%: jm-setup
	LC_ALL=C $(MAKE) translate-$* \
	  PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)" -C $(PERKAMON_DIR)

stats:	jm-setup
	@LC_ALL=C $(MAKE) stats \
	  PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)" -C $(PERKAMON_DIR)

untrans-stats:	jm-setup
	@LC_ALL=C $(MAKE) stats \
	  PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)" -C $(PERKAMON_DIR) \
	  2>&1 | grep -vE ' translated messages\.$$'

jm-setup:	stamp-jm-setup
stamp-jm-setup:
	# Create symlink to po4a/*/po in the top dir.
	set -e; for d in $(PERKAMON_DIR)/po4a/*; do \
	  if [ ! -e $$d/po ]; then \
	    t=$$(echo $$d | sed -e "s|$(PERKAMON_DIR)/||"); \
	    ln -s ../../../$$t/po $$d/po; \
	  fi; \
	done
	# Create symlink to original dir instead of downloading tarball.
	cd $(PERKAMON_DIR) && \
	  if [ ! -e man-pages ]; then \
	    ln -s ../original man-pages; \
	  fi && \
	  touch stamp-unpack-release && \
	  touch stamp-unpack
	cd $(PERKAMON_DIR) && make setup
	@set -e; if [ ! -e $(PERKAMON_DIR)/build/ja ]; then \
	  ln -s ../../draft $(PERKAMON_DIR)/build/ja; \
	fi
	touch $@

clean-setup:
	$(RM) stamp-jm-setup
	$(RM) $(PERKAMON_DIR)/man-pages
	$(RM) $(PERKAMON_DIR)/stamp-*
	$(RM) -rf $(PERKAMON_DIR)/build
	find $(PERKAMON_DIR) -type l | xargs $(RM)
