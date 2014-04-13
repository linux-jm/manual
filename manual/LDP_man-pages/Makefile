PERKAMON_DIR = perkamon
LANGS = ja
THRESH = 80
THRESH_REL = 80
FLAGS ?=
PO4AFLAGS ?= -k $(THRESH) $(FLAGS)

PO4A_SUBDIRS = $(notdir $(wildcard po4a/*))

.PHONY:	all release translate

all:	translate
translate:	translate-pages update-stats
release: 	release-pages update-tl-finish check-tl-nofinish

translate-pages:	$(patsubst %, stamp/%, $(PO4A_SUBDIRS))
stamp/%:	stamp-jm-setup po4a/%/po/ja.po
	@echo "*************** translate: $* ***************"
	mkdir -p stamp
	LC_ALL=C $(MAKE) process-$* \
	  PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)" -C $(PERKAMON_DIR)
	touch $@

release-pages:
	../../admin/JM-release-all.sh -c

update-stats:	untrans.html

untrans.html:	$(patsubst %, stats/%, $(PO4A_SUBDIRS))
	@echo "*************** Updating translation statistics ***************"
	./tools/generate-list.pl $^ > $@

stats/%:	stamp-jm-setup po4a/%/po/ja.po
	@echo "*************** stats: $* ***************"
	mkdir -p stats
	mkdir -p _transtmp
	$(RM) $(PERKAMON_DIR)/build/ja
	ln -s ../../_transtmp $(PERKAMON_DIR)/build/ja
	LC_ALL=C $(MAKE) process-$* \
	  PO4AFLAGS="-k 100 $(FLAGS)" LANGS="$(LANGS)" -C $(PERKAMON_DIR) \
	  | tee _log.txt
	./tools/extract-untrans.pl < _log.txt > $@
	$(RM) $(PERKAMON_DIR)/build/ja
	ln -s ../../draft $(PERKAMON_DIR)/build/ja
	$(RM) -r _transtmp
	$(RM) _log.txt

clean-stats:
	$(RM) -r stats

update-tl-finish:
	@cat stats/* | grep -v '^#' | cut -d , -f 1 | sort > _stats.txt
	@grep '^[×☆]' translation_list | cut -d : -f 5-6 | sed -e 's/:/./' | sort > _tr_todo.txt
	@for p in `comm -23 _tr_todo.txt _stats.txt`; do \
	  ../../admin/JM-tl-modify.pl -U translation_list $$p RO; \
	done
	@$(RM) _stats.txt _tr_todo.txt

check-tl-nofinish:
	@cat stats/* | grep -v '^#' | cut -d , -f 1 | sort > _stats.txt
	@grep '^○' translation_list | cut -d : -f 5-6 | sed -e 's/:/./' | sort > _tr_finish.txt
	@comm -12 _tr_finish.txt _stats.txt
	@$(RM) _stats.txt _tr_finish.txt

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

postats:	jm-setup
	@LC_ALL=C $(MAKE) stats \
	  PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)" -C $(PERKAMON_DIR)

untrans-postats:	jm-setup
	@LC_ALL=C $(MAKE) stats \
	  PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)" -C $(PERKAMON_DIR) \
	  2>&1 | grep -vE ' translated messages\.$$'

jm-setup:	stamp-jm-setup
stamp-jm-setup:
	@# Check perkamon/po4a and JM/po4a
	ls -1 $(PERKAMON_DIR)/po4a | sort > _po4a_list_perkamon
	ls -1 po4a | sort > _po4a_list_jm
	set -e; for d in `comm -13 _po4a_list_perkamon _po4a_list_jm`; do \
	  echo $$d; \
	  rm -vrf po4a/$$d; \
	done
	set -e; for d in `comm -23 _po4a_list_perkamon _po4a_list_jm`; do \
	  echo $$d; \
	  mkdir -vp po4a/$$d/po; \
	done
	rm _po4a_list_jm _po4a_list_perkamon
	@# Create symlink to po4a/*/po in the top dir.
	set -e; for d in $(PERKAMON_DIR)/po4a/*; do \
	  if [ ! -e $$d/po ]; then \
	    t=$$(echo $$d | sed -e "s|$(PERKAMON_DIR)/||"); \
	    ln -s ../../../$$t/po $$d/po; \
	  fi; \
	done
	cd $(PERKAMON_DIR) && make setup
	@set -e; if [ ! -e $(PERKAMON_DIR)/build/ja ]; then \
	  ln -s ../../draft $(PERKAMON_DIR)/build/ja; \
	fi
	ln -s ../../add_ja $(PERKAMON_DIR)/po4a
	touch $@

clean-setup:
	$(RM) stamp-jm-setup
	$(RM) $(PERKAMON_DIR)/man-pages || true
	$(RM) $(PERKAMON_DIR)/stamp-*
	$(RM) -rf $(PERKAMON_DIR)/build
	find $(PERKAMON_DIR) -type l | xargs $(RM)

upgrade:
	$(MAKE) clean-setup
	$(MAKE) jm-setup
	$(MAKE) FLAGS="--no-translations -v --force" translate-pages
	$(MAKE) update-stats

help:
	@echo "Available targets:"
	@echo "   translate       Generate draft from po files"
	@echo "   translate-<SEC> Generate draft from the specified po file"
	@echo "   release         Generate release from po files"
	@echo ""
	@echo "   update-stats    Update per-page trans stats"
	@echo "   clean-stats     Remove all caches of per-page trans stats"
	@echo "   postats         Display per-po trans stats"
	@echo "   untrans-postats Display per-po trans stats (untrans only)"
	@echo ""
	@echo "   jm-setup        Setup perkamon environment"
	@echo "   clean-setup     Clean perkamon environment"
