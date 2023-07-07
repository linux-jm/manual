# この Makefile が何をやるもので、どのように使うかについては、
# 同一ディレクトリの about_this_makefile.txt をご覧ください。

include ../../JM.rules

PACKAGE = $(shell basename `pwd`)
MANTYPE = info
WWWDEST = $(WWWROOT)/$(MANTYPE)/$(PACKAGE)

GITTOP = $(ROOT)/jm.git
INFOPKGWWW = $(GITTOP)/www/info-pkg
INFOTMPDIR = $(TMPDIR)/info
INFORELEASE = $(shell env LANG=C date +"%Y%m%d")
INFODEST = info-ja-GNU_which-$(INFORELEASE)

TEXI2HTML = texi2html
TEXIFILE = release/which-ja.texi
HTMLDIR = html
HTMLFILE = $(HTMLDIR)/which-ja.html

html:	$(HTMLFILE)

$(HTMLFILE):	$(TEXIFILE)
	mkdir -p $(HTMLDIR)
	$(TEXI2HTML) --output=$@ $<

clean:
	$(RM) -r $(HTMLDIR)
	$(RM) -r $(INFOPKGWWW)

html-install:	$(HTMLFILE)
	mkdir -p $(WWWDEST)
	rsync -av --delete $(HTMLDIR)/ $(WWWDEST)
	-$(RM) -r $(HTMLDIR)

pkg-install:
	[ -d $(INFOPKGWWW) ] || mkdir -p $(INFOPKGWWW)
	-$(RM) $(INFOPKGWWW)/info-ja-GNU_which-*
	[ -d $(INFOTMPDIR) ] || mkdir -p $(INFOTMPDIR)
	-$(RM) -r $(INFOTMPDIR)/info-ja-GNU_which-*
	mkdir -p $(INFOTMPDIR)/$(INFODEST)
	cp -p release/* $(INFOTMPDIR)/$(INFODEST)
	cd $(INFOTMPDIR); \
	tar czf $(INFODEST).tar.gz $(INFODEST); \
	cp -p $(INFODEST).tar.gz $(INFOPKGWWW)

install:	html-install pkg-install

# 上記 pkg-install ターゲットの最後の cp では、info マニュアルの
# タールボールを $(INFOTMPDIR) から jm.git/www/info-pkg/ ディレクトリに
# コピーしている。こうしておくと、後で jm.git/www/Makefile が実行される際に、
# その download.html ターゲット中で本マニュアル・パッケージを公開リストに
# 登録する処理が行われることになる。さらに、同 Makefile の install 
# ターゲット中で "$(RSYNC) ... * ... $(WWWROOT)" が行われて、
# (このワイルドカード "*" に info-pkg ディレクトリも含まれるので) 
# jm.git/www 中の info-pkg/* も $(WWWROOT)=$(ROOT)/htdocs、
# すなわち、JM の公開ディレクトリにコピーされるのである。
