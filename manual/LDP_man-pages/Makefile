# Upstream version
V = 5.10

PERKAMON_DIR = perkamon
LANGS = ja
THRESH = 80
THRESH_REL = 80
FLAGS ?=
PO4AFLAGS ?= -k $(THRESH) $(FLAGS)

PO4A_SUBDIRS = $(sort $(patsubst %.cfg, %, $(notdir $(wildcard po4a/*/*.cfg))))

.PHONY:	all release translate

all:	translate
translate:	translate-pages update-stats
release: 	release-pages update-tl-finish check-tl-nofinish

translate-pages:	$(patsubst %, stamp/%, $(PO4A_SUBDIRS))
stamp/%:	stamp-setup po4a/%/po/ja.po po4a/%/*.cfg
	@echo "*************** translate: $* ***************"
	mkdir -p stamp
	po4a $(PO4AFLAGS) --variable langs='$(LANGS)' --previous --srcdir . --destdir . po4a/$*/$*.cfg
	touch $@

release-pages:
	../../admin/JM-release-all.sh -c

update-stats:	untrans.html

untrans.html:	$(patsubst %, stats/%, $(PO4A_SUBDIRS))
	@echo "*************** Updating translation statistics ***************"
	./tools/generate-list.pl $^ > $@
	if [ -f EXCLUDED_PAGES.txt ]; then \
	  ./tools/generate-list.pl -e EXCLUDED_PAGES.txt $^ > untrans-partial.html; \
	fi

stats/%:	stamp-setup po4a/%/po/ja.po po4a/%/*.cfg
	@echo "*************** stats: $* ***************"
	mkdir -p stats
	mkdir -p _transtmp
	$(RM) build/ja
	ln -s ../_transtmp build/ja
	LC_ALL=C po4a -k 100 $(FLAGS) --variable langs='$(LANGS)' --previous --srcdir . --destdir . po4a/$*/$*.cfg | tee _log.txt
	./tools/extract-untrans.pl < _log.txt > $@
	$(RM) build/ja
	ln -s ../draft build/ja
	$(RM) -r _transtmp
	$(RM) _log.txt

clean-stats:
	$(RM) -r stats

update-tl-finish:
	@cat stats/* | grep -v '^#' | cut -d , -f 1 | sort > _stats.txt
	@grep '^[×☆]' translation_list | cut -d : -f 5-6 | sed -e 's/:/./' | sort > _tr_todo.txt
	@find draft -type f | cut -d / -f 3 | sort > _all_drafts.txt
	@for p in `comm -23 _tr_todo.txt _stats.txt`; do \
	  ../../admin/JM-tl-modify.pl -U translation_list $$p RO; \
	done
	@# 翻訳が完了していないが公開の基準を満たす翻訳率のページは
	@# translation_list で ☆ マークで、バージョンは最新版のみを表示
	@# ウェブページでは古いバージョンのものは括弧付きで表示される。
	@for p in `comm -12 _tr_todo.txt _all_drafts.txt`; do \
	  ../../admin/JM-tl-modify.pl -r -T -U translation_list $$p UN; \
	done
	@$(RM) _stats.txt _tr_todo.txt _all_drafts.txt

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
	@LC_ALL=C $(MAKE) stats PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)"

untrans-postats:	jm-setup
	@LC_ALL=C $(MAKE) stats PO4AFLAGS="$(PO4AFLAGS)" LANGS="$(LANGS)" \
	  2>&1 | grep -vE ' translated messages\.$$'

stats:: $(patsubst %, stats-%, $(LANGS))
stats-%:
	@set -e; for subs in $(PO4A_SUBDIRS); do \
	  echo -n "$$subs: " >&2; \
	  msgfmt --statistics -o /dev/null po4a/$$subs/po/$*.po; \
	done
	@set -e; for subs in $(PO4A_SUBDIRS); do \
	  LC_ALL=C msgfmt --statistics -o /dev/null po4a/$$subs/po/$*.po; \
	done 2>&1 | perl -e '$$f=$$t=$$u; while (<>) {if (/([0-9]*) translated/) {$$t+=$$1;} if (/([0-9]*) untranslated/) {$$u+=$$1;} if (/([0-9]*) fuzzy/) {$$f+=$$1;}} printf "%d translated, %d fuzzy, %d untranslated ==> %.2f%%\n", $$t, $$f, $$u, (100*$$t/($$t+$$f+$$u))'

man-pages-$(V).tar.xz:
	wget https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/$@

stamp-unpack:	man-pages-$(V).tar.xz
	tar Jxf man-pages-$(V).tar.xz
	@#  Remove version from top-level directory so that V variable
	@#  does not have to be used in targets below
	mv man-pages-$(V) man-pages
	@#  Remove stamp-setup to force re-run of 'setup' target
	-rm -f stamp-setup
	touch $@

setup:		stamp-setup
jm-setup:	setup
stamp-setup:	stamp-unpack
	-rm -rf build
	mkdir -p build/C
	for i in $$(seq 8); do mkdir build/C/man$$i; done
	@#  Some manual pages are only aliases, they contain a single line
	@#      .so target_man_page
	@#  Create a file named 'link', its format is:
	@#      target_man_page src_man_page
	@#  This file is used after pages are translated to create aliases
	@#  of translated manual pages.
	set -e; for f in man-pages/man?/*.?; do \
	  if sed -e '1,3!d' $$f | grep -q '^\.so'; \
	  then \
	    grep '^\.so' $$f | sed -e '1!d' -e 's/^\.so //' -e "s,$$, $${f#man-pages/}," >> build/C/link; \
	  else \
	    cp $$f build/C/$${f#man-pages/}; \
	  fi; \
	done
	LC_ALL=C sort build/C/link > temp && mv temp build/C/link
	@#  Remove empty directories, if any
	-rmdir build/C/man* 2>/dev/null
	@#  Apply patches to fix groff syntax errors which  prevent po4a processing
	if test -f workaround.patch; \
	then \
	  cd build/C && patch -p2 < $(CURDIR)/workaround.patch; \
	fi
	@set -e; if [ ! -e build/ja ]; then \
	  ln -s ../draft build/ja; \
	fi
	ln -s ../add_ja po4a/add_ja
	touch $@

clean:	clean-setup
clean-setup:
	$(RM) stamp-*
	$(RM) -r stamp
	$(RM) po4a/add_ja
	$(RM) -r man-pages build

upgrade:
	$(MAKE) clean
	$(MAKE) setup
	cd man-pages \
	  && ../../../admin/JM-orig-upd.sh ../original \
	  && cp README man-pages-* Changes* ../original
	git add --all original/
	#git status original | ../../admin/git2upd > upd.txt
	#../../admin/upd_tl.perl translation_list upd.txt $(V)
	#mv translation_list.* translation_list
	#$(MAKE) FLAGS="--no-translations -v --force" translate-pages
	#$(MAKE) update-stats
	#git add translation_list
	#git commit -m "LDP: Update original to LDP v$(V)" original/ translation_list
	#git add po4a/ stats/ untrans.html
	#git commit -m "LDP: Update POT and ja.po to LDP v$(V)" po4a/ stats/ untrans.html

disable-removed:
	@set -e; for f in po4a/*/*.cfg; do \
	  for i in $$(grep '^\[type: man\]' $$f | sed -e 's,.* build/C/,build/C/,' -e 's, \\,,'); do \
	    test -f $$i && continue; \
	    echo "Missing file $$i disabled in $$f"; \
	    sed -i -e '/\[type: man\] '"$$(echo $$i | sed -e 's,/,\\/,g')"'/,/[^\\]$$/s/^/#/' $$f; \
	  done; \
	done

#  Run this target after a new upstream release to see if pages have been added.
#  Copy and paste output in po4a .cfg files
print-new-files:
	@set -e; for f in build/C/man?/*.?; do \
	  l="$${f#build/C/}"; \
	  grep -q "^\\[type: man\\] build/C/$$l" po4a/*/*.cfg && continue; \
	  o=$$(echo $$l | sed -e 's,/,/local-,'); \
	  printf '[type: man] %s \\\n\t%s \\\n' build/C/$$l "\$$lang:build/\$$lang/$$l"; \
	  if grep -q hlm $$f; then printf '\topt:"-o untranslated=hlm" \\\n'; fi; \
	  printf '\tadd_$$lang:?@po4a/add_$$lang/lists/local-pre.list \\\n'; \
	  printf '\tadd_$$lang:?@po4a/add_$$lang/lists/'$$o'.list \\\n'; \
	  printf '\tadd_$$lang:?po4a/add_$$lang/perkamon \\\n'; \
	  printf '\tadd_$$lang:?@po4a/add_$$lang/lists/'$$l'.list \\\n'; \
	  printf '\tadd_$$lang:?po4a/add_$$lang/addendum \\\n'; \
	  printf '\tadd_$$lang:?@po4a/add_$$lang/lists/local-post.list\n'; \
	  echo; \
	done

help:
	@echo "Available targets:"
	@echo "   translate               Generate draft from po files"
	@echo "   translate-<SEC>         Generate draft from the specified po file"
	@echo "   release                 Generate release from po files"
	@echo ""
	@echo "   update-stats            Update per-page trans stats"
	@echo "   clean-stats             Remove all caches of per-page trans stats"
	@echo "   postats                 Display per-po trans stats"
	@echo "   untrans-postats         Display per-po trans stats (untrans only)"
	@echo ""
	@echo "   setup (or jm-setup)     Setup environment"
	@echo "   clean (or clean-setup)  Clean environment"
