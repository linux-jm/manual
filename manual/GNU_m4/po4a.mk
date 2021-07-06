#
# Part of Makefile rules for po4a proccesing
# type: one-cfg
#
# Written by Michio MATSUYAMA <michio_matsuyama@yahoo.co.jp>
#
.DEFAULT_GOAL := all
COMMENT = "This is generated from Makefile automatically.  Need NOT to edit."

# 変数設定
-include .mk/po4a-def.mk
.mk/po4a-def.mk: po4a.mk Makefile
	@mkdir -p $(@D)
	@echo "# $(COMMENT)">$@
	@for n in $(man_numbers); do \
	  echo >>$@ ;\
	  echo "man$${n}_filepaths   =  \$$(addsuffix .$${n},\$$(addprefix release/man$$n/,\$$(man$${n}_sources)))" >>$@ ;\
	  echo "man$${n}_srcs_simple =  \$$(addsuffix .$${n},\$$(man$${n}_sources))" >>$@ ;\
	  echo "man_srcs_simple     +=  \$$(man$${n}_srcs_simple)" >>$@ ;\
	  echo "draft$${n}_filepaths =  \$$(addsuffix .$${n},\$$(addprefix draft/man$$n/,\$$(man$${n}_sources)))" >>$@ ;\
	  echo "po$${n}_filepaths    =  \$$(addprefix po4a/,ja.po)" >>$@ ;\
	  echo "draft_filepaths    += \$$(draft$${n}_filepaths)" >>$@ ;\
	  echo "po_filepaths       += \$$(po$${n}_filepaths)" >>$@ ;\
	  echo "man_filepaths      += \$$(man$${n}_filepaths)" >>$@ ;\
	done

all: translate

# man ファイル生成ルール ("one-cfg")
-include .mk/po4a-man.mk
.mk/po4a-man.mk: po4a.mk .mk/po4a-def.mk
	@echo "# $(COMMENT)">$@
	@echo >>$@
	@echo "translate: gencfg" >>$@
	@echo "	po4a \$$(PO4A_FLAGS) -v --variable langs='\$$(LANGS)' \\" >> $@
	@echo "	  --previous po4a/\$$(PACKAGE_NAME).cfg" >> $@

# draft ファイル自動生成ルール
-include .mk/po4a-draft.mk
.mk/po4a-draft.mk: po4a.mk .mk/po4a-def.mk
	@echo "# $(COMMENT)">$@
	@echo >>$@
	@echo "draft: \$$(draft_filepaths) gendraft.perl"   >>$@
	@for n in $(man_numbers); do \
	  echo >>$@ ;\
	  echo "\$$(draft$${n}_filepaths): draft/man$${n}/%.$${n}: release/man$${n}/%.$${n}"   >>$@ ;\
	  echo "	@echo Auto-generating draft for \$$@..." >>$@ ;\
	  echo "	@mkdir -p draft/man$${n}" >>$@ ;\
	  echo "	@perl ./gendraft.perl \\"  >>$@ ;\
	  echo "	  original/man$${n}/\$$*.$${n} \\" >>$@ ;\
	  echo "	  release/man$${n}/\$$*.$${n} \\" >>$@ ;\
	  echo "	  draft/man$${n}/\$$*.$${n}" >>$@ ;\
	done

# copyright ファイル生成
gencopyright:
	@mkdir -p po4a/add_ja/copyright
	$(eval TIMESTAMP=$(shell date '+%Y-%m-%d'))
	@cd po4a/add_ja/copyright ;\
	 for f in $(man_srcs_simple); do \
	  if test ! -f $$f.txt; then \
	    echo "PO4A-HEADER: mode=before; position=^\\.TH"   >  $$f.txt ;\
	    echo ".\\\""                                       >> $$f.txt ;\
	    echo ".\\\" Translated $(TIMESTAMP)"               >> $$f.txt ;\
	    echo ".\\\"    by $(AUTHOR_NAME) <$(AUTHOR_EMAIL)>">> $$f.txt ;\
	    echo ".\\\""                                       >> $$f.txt ;\
	  fi \
	done

# translation_list ファイル生成
translation_list:
	@if test ! -f $@; then \
	  for p in $(man_srcs_simple); do \
	    echo -n "×:$(PACKAGE_NAME):$(PACKAGE_VERSION):$(PACKAGE_DATE):" >> $@ && \
            echo -n $$p | sed -e "s/^\(.*\)\.\([1-8]\)$$/\1:\2/" >> $@ &&\
	    echo    ":0000/00/00::$(AUTHOR_EMAIL):$(AUTHOR_NAME):" >> $@; \
	  done \
	fi

# $(PACKAGE_NAME).cfg ファイル生成
-include .mk/po4a-cfg.mk
.mk/po4a-cfg.mk: po4a.mk .mk/po4a-def.mk
	@mkdir -p po4a
	@echo "# $(COMMENT)">$@
	@echo >>$@
	@echo "-include .mk/po4a-cfg-sub.mk" >>$@
	@echo ".mk/po4a-cfg-sub.mk: .mk/po4a-cfg.mk" >>$@
	@echo "	@echo \"# \$$(COMMENT)\">\$$@" >>$@
	@echo "	@echo >>\$$@" >>$@
	@echo "	@echo \"gencfg: po4a/\\\$$\$$(PACKAGE_NAME).cfg\" >>\$$@" >>$@
	@echo "	@echo \"po4a/\\\$$\$$(PACKAGE_NAME).cfg: .mk/po4a-cfg-sub.mk\" >>\$$@" >>$@
	@echo "	@echo \"	@if test ! -f \\\$$\$$@; then \\\\\" >>\$$@" >>$@
	@echo "	@echo \"	  echo \\\"\"[po4a_langs] ja\\\"\" >\\\$$\$$@ ;\\\\\" >>\$$@" >>$@
	@echo "	@echo \"	  echo \\\"\"[po4a_paths] po4a/\$$(PACKAGE_NAME).pot \\\\\\\$$\$$\\\$$\$$lang:po4a/\\\\\\\$$\$$\\\$$\$$lang.po\\\"\" >>\\\$$\$$@ ;\\\\\" >>\$$@" >>$@
	@echo "	@echo \"	  for f in \\\$$\$$(man_srcs_simple); do \\\\\" >>\$$@" >>$@
	@echo "	@echo \"	    echo >>\\\$$\$$@ ;\\\\\" >>\$$@" >>$@
	@echo "	@echo \"	    echo \\\$$\$$\\\$$\$$f | sed -n \\\"s|^\\\\(.*\\\\)\\\\.\\\\([1-8]\\\\)\\\$$\$$\\\$$\$$|[type: man] original/man\\\\2/\\\\1.\\\\2 \\\\\\\$$\$$\\\$$\$$lang:release/man\\\\2/\\\\1.\\\\2 \\\\\\\\\|p\\\" >>\\\$$\$$@ ;\\\\\" >>\$$@" >>$@
	@echo "	@echo \"	    echo \\\$$\$$\\\$$\$$f | sed -n \\\"s|^\\\\(.*\\\\)\\\\.\\\\([1-8]\\\\)\\\$$\$$\\\$$\$$|	add_\\\\\\\$$\$$\\\$$\$$lang:\\?po4a/add_\\\\\\\$$\$$\\\$$\$$lang/copyright/\\\\1.\\\\2.txt|p\\\" >>\\\$$\$$@ ;\\\\\" >>\$$@" >>$@
	@echo "	@echo \"	  done \\\\\" >>\$$@" >>$@
	@echo "	@echo \"	fi\" >>\$$@" >>$@


# 翻訳統計確認
stat:
	@for f in $(po_filepaths); do \
	  echo -n "$$f: "; \
	  msgfmt --statistics -o /dev/null $$f; \
	done

clean::

distclean:: clean
	rm -f .mk/po4a-{cfg,def,draft,man,po}.mk

.PHONY: all gencopyright stat clean distclean
