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
all: man.cgi .htaccess $(MANDB)

../../www-html-modified:
	$(MAKE) -C ../../ www-html-modified

$(MANDB): ../../www-html-modified $(MKDB)
	-$(RM) $@
	$(MKDB) $(WWWROOT) $(URLHTML)

.htaccess: htaccess.in
	cp htaccess.in .htaccess

man.cgi: man.cgi.in
	cp $< $@
	perl -p -i -e 's@%PAGEROOT%@$(WWWROOT)@; s@%URLROOT%@$(URLROOT)@' $@

install: all
	@mkdir -p $(CGIROOT)
	install -m 555 man.cgi $(CGIROOT)
	install -m 644 $(MANDB) $(CGIROOT)
	install -m 644 .htaccess $(CGIROOT)

clean:
	@rm -f .htaccess $(MANDB) man.cgi

