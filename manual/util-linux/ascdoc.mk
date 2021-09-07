#
# This is a temporary Makefile for util-linux
#
# 利用手順:
#  1) 処理対象とする util-linux ソースをあらかじめ
#     準備して、 そのディレクトリトップを SRCDIR に
#     設定。
#  2) make -f ascdoc.mk 実行。
#      --> po4a/ascdoc/util-linux-man.pot,
#          po4a/ascdoc/ja.po が生成される。
#      --> 最終成果である man ページファイルは
#          po4a/ascdoc/ja/ja 以下に生成される。
#  3) make -f ascdoc.mk msgmerge 実行。
#      --> 上記 ja.po に対して、
#          従来の man ファイルを 1 次ソースとする
#          po4a ja.po ファイルの内容がマージされる。
#  4) 以降は、po4a/ascdoc/ja.po を編集
#  5) 適宜 make -f ascdoc.mk を実行して、
#     po4a/ascdoc/ja/ja 以下の man ファイル確認。
#
# ex.) SRCDIR = ~/src/util-linux-2.37.2
SRCDIR = 

ASCDOC_DIRS = \
	disk-utils  \
	lib         \
	libblkid    \
	libuuid     \
	login-utils \
	man-common  \
	misc-utils  \
	schedutils  \
	sys-utils   \
	term-utils  \
	text-utils

.PHONY: all copy_ascdocs

all: copy_ascdocs
	@cd po4a/ascdoc && $(MAKE) --no-print-directory -f Makefile.ja
%:
	@cd po4a/ascdoc && $(MAKE) --no-print-directory -f Makefile.ja $@

copy_ascdocs: copy_ascdocs.stamp
copy_ascdocs.stamp:
	@if test -z $(SRCDIR); then \
	  echo SRCDIR should be set correctly && exit 1 ; \
	elif test ! -d $(SRCDIR); then \
	  echo SRCDIR cannot be found && exit 1; \
	fi
	@for d in $(ASCDOC_DIRS); do \
	  if test ! -d $(SRCDIR)/$$d; then \
	    echo $(SRCDIR)/$$d cannot be found && exit 1; \
	  fi ;\
	  mkdir -p original/$$d ;\
	  if test "$$d" = "libuuid"; then \
	    mkdir -p original/$$d/man ;\
	    cp -pR $(SRCDIR)/$$d/man/*.adoc original/$$d/man ;\
	  else \
	    cp -pR $(SRCDIR)/$$d/*.adoc original/$$d ;\
	  fi \
	done
	@touch $@

.PHONY: clean distclean
clean:
	rm -f copy_ascdocs.stamp
	rm -f po4a/ascdoc/{po4a-gen,gen-mans}.stamp
distclean: clean
	rm -fr $(addprefix original/,$(ASCDOC_DIRS))
