#
# Copyright (c) 2021 Linux JM project
#         all rights reserved.
#
# po4a 処理タイプ "sub" 用
#   "sub" とは po4a 処理における po ファイルを
#   man ページと 1 対 1 の対応で 1 つずつ生成する方式のこと。
#   さらに 1 つずつにおいて po4a が利用する cfg ファイルを生成する。
#
#   (これに対比されるのが "one" であり、これは ja.po ただ 1 つ
#    を生成する方式のこと。)
#
.DEFAULT_GOAL := all
COMMENT = "This is generated from Makefile automatically. Need NOT to edit."

# 変数設定
-include mk/po4a-def.mk
mk/po4a-def.mk: po4a.mk Makefile
	@mkdir -p $(@D)
	@echo "# $(COMMENT)">$@
	@for n in $(man_numbers); do \
	  echo >>$@ ;\
	  echo "man$${n}_filepaths   =  \$$(addsuffix .$${n},\$$(addprefix tmp/draft/man$$n/,\$$(man$${n}_sources)))" >>$@ ;\
	  echo "man$${n}_srcs_simple =  \$$(addsuffix .$${n},\$$(man$${n}_sources))" >>$@ ;\
	  echo "man_srcs_simple     +=  \$$(man$${n}_srcs_simple)" >>$@ ;\
	  echo "draft$${n}_filepaths =  \$$(addsuffix .$${n},\$$(addprefix draft/man$$n/,\$$(man$${n}_sources)))" >>$@ ;\
	  echo "po$${n}_filepaths    =  \$$(addprefix po4a/man$${n}/,\$$(addsuffix .po,\$$(man$${n}_sources)))" >>$@ ;\
	  echo "draft_filepaths    += \$$(draft$${n}_filepaths)" >>$@ ;\
	  echo "po_filepaths       += \$$(po$${n}_filepaths)" >>$@ ;\
	  echo "man_filepaths      += \$$(man$${n}_filepaths)" >>$@ ;\
	done

all: translate

# man ファイル生成ルール (処理タイプ "sub" 用)
-include mk/po4a-man.mk
mk/po4a-man.mk: po4a.mk mk/po4a-def.mk
	@echo "# $(COMMENT)">$@
	@echo >>$@
	@echo -n "translate:: gencfg" >>$@
	@for n in $(man_numbers); do \
	  echo -n " man$$n" >>$@ ;\
	done
	@echo >>$@
	@for n in $(man_numbers); do \
	  echo >>$@ ;\
	  echo "man$$n:" >>$@ ;\
	  echo "	po4a \$$(PO4A_FLAGS) -v --variable langs='\$$(LANGS)' \\" >> $@ ;\
	  echo "	  --previous po4a/man$$n/\$$(PACKAGE_NAME)-man$$n.cfg" >> $@ ;\
	done

# draft ファイル自動生成ルール
-include mk/po4a-draft.mk
mk/po4a-draft.mk: po4a.mk mk/po4a-def.mk
	@echo "# $(COMMENT)">$@
	@echo >>$@
	@echo "draft: \$$(draft_filepaths) gendraftfrom.perl"   >>$@
	@for n in $(man_numbers); do \
	  echo >>$@ ;\
	  echo "\$$(draft$${n}_filepaths): draft/man$${n}/%.$${n}: tmp/draft/man$${n}/%.$${n}"   >>$@ ;\
	  echo "	@echo Auto-generating draft for \$$@..." >>$@ ;\
	  echo "	@mkdir -p draft/man$${n}" >>$@ ;\
	  echo "	@perl ./gendraftfrom.perl \\"  >>$@ ;\
	  echo "	  original/man$${n}/\$$*.$${n} \\" >>$@ ;\
	  echo "	  tmp/draft/man$${n}/\$$*.$${n} \\" >>$@ ;\
	  echo "	  draft/man$${n}/\$$*.$${n}" >>$@ ;\
	done

# copyright ファイル生成
gencopyright:
	@mkdir -p po4a/add_ja/copyright
	$(eval TIMESTAMP=$(shell date '+%Y-%m-%d'))
	@cd po4a/add_ja/copyright ;\
	 for p in $(man_srcs_simple); do \
	  if test ! -f $$p.txt; then \
	    echo "PO4A-HEADER: mode=before; position=^\\.TH"   >  $$p.txt ;\
	    echo ".\\\""                                       >> $$p.txt ;\
	    echo ".\\\" Translated $(TIMESTAMP)"               >> $$p.txt ;\
	    echo ".\\\"    by $(AUTHOR_NAME) <$(AUTHOR_EMAIL)>">> $$p.txt ;\
	    echo ".\\\""                                       >> $$p.txt ;\
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

# po4a/man%/$(PACKAGE_NAME)-man%.cfg ファイル生成
-include mk/po4a-cfg.mk
mk/po4a-cfg.mk: po4a.mk mk/po4a-def.mk
	@mkdir -p po4a
	@echo "# $(COMMENT)">$@
	@for n in $(man_numbers); do \
	  echo >>$@ ; \
	  echo "-include mk/po4a-cfg-sub$$n.mk" >>$@ ;\
	  echo "mk/po4a-cfg-sub$$n.mk: mk/po4a-cfg.mk" >>$@ ;\
	  echo "	@echo \"# \$$(COMMENT)\">\$$@" >>$@ ;\
	  echo "	@echo >>\$$@" >>$@ ;\
	  echo "	@echo \"gencfg:: po4a/man$$n/\$$(PACKAGE_NAME)-man$$n.cfg\" >>\$$@" >>$@ ;\
	  echo "	@echo \"po4a/man$$n/\$$(PACKAGE_NAME)-man$$n.cfg: mk/po4a-cfg-sub$$n.mk\" >>\$$@" >>$@ ;\
	  echo "	@echo \"	@if test ! -f \\\$$\$$@; then \\\\\" >>\$$@" >>$@ ;\
	  echo "	@echo \"	  mkdir -p \\\$$\$$(@D) ;\\\\\" >>\$$@" >>$@ ;\
	  echo "	@echo \"	  echo \\\"\"[po4a_langs] ja\\\"\" > \\\$$\$$@ ;\\\\\" >>\$$@" >>$@ ;\
	  echo "	@echo \"	  echo \\\"\"[po4a_paths] po4a/man$$n/\$$(PACKAGE_NAME)-man$$n.pot \\\\\\\$$\$$\\\$$\$$lang:po4a/man$$n/ja.po\\\"\" >>\\\$$\$$@ ;\\\\\" >>\$$@" >>$@ ;\
	  echo "	@echo \"	  for f in \\\$$\$$(man$${n}_srcs_simple); do \\\\\" >>\$$@" >>$@ ;\
	  echo "	@echo \"	    echo >>\\\$$\$$@ ;\\\\\" >>\$$@" >>$@ ;\
	  echo "	@echo \"	    echo \\\$$\$$\\\$$\$$f | sed -n \\\"s|^\\\\(.*\\\\)\\\\.\\\\([1-8].*\\\\)\\\$$\$$\\\$$\$$|[type: man] original/man\\\\2/\\\\1.\\\\2 \\\\\\\$$\$$\\\$$\$$lang:tmp/draft/man\\\\2/\\\\1.\\\\2 \\\\\\\\\|p\\\" >>\\\$$\$$@ ;\\\\\" >>\$$@" >>$@ ;\
	  echo "	@echo \"	    echo \\\$$\$$\\\$$\$$f | sed -n \\\"s|^\\\\(.*\\\\)\\\\.\\\\([1-8].*\\\\)\\\$$\$$\\\$$\$$|	add_\\\\\\\$$\$$\\\$$\$$lang:\\?po4a/add_\\\\\\\$$\$$\\\$$\$$lang/copyright/\\\\1.\\\\2.txt|p\\\" >>\\\$$\$$@ ;\\\\\" >>\$$@" >>$@ ;\
	  echo "	@echo \"	  done \\\\\" >>\$$@" >>$@ ;\
	  echo "	@echo \"	fi\" >>\$$@" >>$@ ;\
	done


# 翻訳統計確認
stat:
	@for f in $(po_filepaths); do \
	  echo -n "$$f: "; \
	  msgfmt --statistics -o /dev/null $$f; \
	done

clean::

distclean:: clean
	rm -f mk/po4a-{def,draft,man,po}.mk

.PHONY: all gencopyright stat clean distclean
