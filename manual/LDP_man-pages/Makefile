PERKAMON_DIR = perkamon
LANGS = ja
THRESH = 100
THRESH_REL = 80
FLAGS ?=
PO4AFLAGS ?= -k $(THRESH) $(FLAGS)

all: translate

translate: jm-setup
	LC_ALL=C $(MAKE) translate \
	  PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)" -C $(PERKAMON_DIR) \
	  | tee untrans.txt
	./untrans-list.pl < untrans.txt > untrans.html
	$(RM) untrans.txt

translate-%: jm-setup
	LC_ALL=C $(MAKE) translate-$* \
	  PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)" -C $(PERKAMON_DIR)

release:	jm-setup
	rm -f $(PERKAMON_DIR)/build/ja
	ln -s ../../release $(PERKAMON_DIR)/build/ja
	LC_ALL=C $(MAKE) translate \
	  PO4AFLAGS="-k $(THRESH_REL) $(FLAGS)" LANGS="$(LANGS)" -C $(PERKAMON_DIR)
	rm -f $(PERKAMON_DIR)/build/ja
	ln -s ../../draft $(PERKAMON_DIR)/build/ja
	# Do not remove unreleased pages
	@sleep 1
	set -e; if git status release | grep deleted >/dev/null; then \
	  git status release | grep deleted | awk '{print $$3;}' | xargs -n1 echo; \
	  git status release | grep deleted | awk '{print $$3;}' | xargs -n1 git checkout; \
	fi
	# I don't know why untrans.txt is generated in release target
	$(RM) untrans.txt

release-tl:
	set -e; if git status release | grep modified >/dev/null; then \
	  git status release | grep modified | awk '{print $$3;}' | cut -d / -f 3 | xargs -n1 -IXXXXX ../../admin/JM-tl-modify.pl -U translation_list XXXXX RO; \
	fi

format:
	set -e; for d in po4a/*; do \
	  echo "----- $$d -----"; cur=`pwd`; cd $$d/po; \
	  f=`/bin/mktemp`; \
	  LC_ALL=C msgmerge --verbose -o $$f ja.po $$(basename $$d) \
	    && mv -f $$f ja.po; \
	  cd $$cur; \
	done

format-%:
	set -e; for d in po4a/$*; do \
	  cd $$d/po; \
	  f=`/bin/mktemp`; \
	  msgmerge --verbose -o $$f ja.po $$(basename $$d) \
	    && mv -f $$f ja.po; \
	  cd $$cur; \
	done

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
	#cd $(PERKAMON_DIR) && \
	#  if [ ! -e man-pages ]; then \
	#    ln -s ../original man-pages; \
	#  fi && \
	#  touch stamp-unpack-release && \
	#  touch stamp-unpack
	cd $(PERKAMON_DIR) && make setup
	@set -e; if [ ! -e $(PERKAMON_DIR)/build/ja ]; then \
	  ln -s ../../draft $(PERKAMON_DIR)/build/ja; \
	fi
	touch $@

clean-setup:
	$(RM) stamp-jm-setup
	$(RM) $(PERKAMON_DIR)/man-pages || true
	$(RM) $(PERKAMON_DIR)/stamp-*
	$(RM) -rf $(PERKAMON_DIR)/build
	find $(PERKAMON_DIR) -type l | xargs $(RM)
