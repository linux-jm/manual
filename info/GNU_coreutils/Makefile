include ../../JM.rules

PACKAGE = $(shell basename `pwd`)
MANTYPE = info
WWWDEST = $(WWWROOT)/$(MANTYPE)/$(PACKAGE)

GITTOP = $(ROOT)/jm.git
INFOPKGWWW = $(GITTOP)/www/info-pkg
INFOTMPDIR = $(TMPDIR)/info
INFORELEASE = $(shell env LANG=C date +"%Y%m%d")
INFODEST = info-ja-GNU_coreutils-$(INFORELEASE)

TEXI2HTML = texi2html
TEXIFILE = release/coreutils-ja.texi
HTMLDIR = html
HTMLFILE = $(HTMLDIR)/coreutils-ja.html

html:	$(HTMLFILE)

$(HTMLFILE):	$(TEXIFILE)
	mkdir -p $(HTMLDIR)
	$(TEXI2HTML) --output=$(HTMLDIR) --split node $<

clean:
	$(RM) -r $(HTMLDIR)
	$(RM) -r $(INFOPKGWWW)

html-install:	$(HTMLFILE)
	mkdir -p $(WWWDEST)
	rsync -av --delete $(HTMLDIR)/ $(WWWDEST)

pkg-install:
	[ -d $(INFOPKGWWW) ] || mkdir -p $(INFOPKGWWW)
	-rm $(INFOPKGWWW)/info-ja-GNU_coreutils-*
	[ -d $(INFOTMPDIR) ] || mkdir -p $(INFOTMPDIR)
	-rm -rf $(INFOTMPDIR)/info-ja-GNU_coreutils-*
	mkdir -p $(INFOTMPDIR)/$(INFODEST)
	cp -p release/* $(INFOTMPDIR)/$(INFODEST)
	cd $(INFOTMPDIR); \
	tar czf $(INFODEST).tar.gz $(INFODEST); \
	cp -p $(INFODEST).tar.gz $(INFOPKGWWW)

install:	html-install pkg-install

