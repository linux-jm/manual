#
# Makefile for JM-CVS
# $Id:
#
BASENAME   = JM-CVS
#SGML2HTML  = sgml2html -c nippon
SGML2HTML  = sgml21html

SGML2TEXT  = sgml2txt  -c nippon -f

.SUFFIXES: .sgml .html
.SUFFIXES: .sgml .txt

.sgml.html:
	$(SGML2HTML) $<

.sgml.txt:
	$(SGML2TEXT) $<
	cutblank 1 < $@ > $@.orig
	mv -f $@.orig $@

default: $(BASENAME).txt $(BASENAME).html

all: default $(BASENAME).sgml.gz $(BASENAME)-html.tar.gz

$(BASENAME).sgml.gz: $(BASENAME).sgml
	cat $< | gzip -9 > $@

$(BASENAME)-html.tar.gz: $(BASENAME).html
	tar zcf $@ $(BASENAME)*.html

install:
      
clean:
	rm -f $(BASENAME).txt $(BASENAME)*.html $(BASENAME)*.gz
