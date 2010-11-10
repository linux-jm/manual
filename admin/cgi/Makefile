# $Id: Makefile,v 1.9 2000/08/25 05:56:26 nakano Exp $

# modify these to fit your env.
#
include ../../JM.rules

#
# defs
#
MKDB=../../bin/mkhtmldb.perl
MANDB=manhtmldb

#
# rules
#
all: man.cgi $(MANDB)

../../stamp/www-html-modified:
	$(MAKE) -C ../../ stamp/www-html-modified

$(MANDB): ../../stamp/www-html-modified $(MKDB)
	-$(RM) $@
	$(MKDB) $(WWWROOT) $(URLHTML)

man.cgi: man.cgi.in
	$(RM) $@
	nkf -w $< > $@
	perl -p -i -e 's@%PAGEROOT%@$(WWWROOT)@; s@%URLROOT%@$(URLROOT)@' $@

install: all
	@mkdir -p $(CGIROOT)
	install -m 555 man.cgi $(CGIROOT)
	install -m 644 $(MANDB) $(CGIROOT)

clean:
	@rm -f $(MANDB) man.cgi

