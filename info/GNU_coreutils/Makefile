include ../../JM.rules

PACKAGE = $(shell basename `pwd`)
MANTYPE = info
WWWDEST = $(WWWROOT)/$(MANTYPE)/$(PACKAGE)

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

install:	$(HTMLFILE)
	mkdir -p $(WWWDEST)
	rsync -av --delete $(HTMLDIR)/ $(WWWDEST)
