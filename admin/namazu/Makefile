#
# $Id: Makefile,v 1.5 2000/01/20 21:26:28 nakano Exp $

# modify these to fit your env.
#
include ../../JM.rules

#
# defs
#
HTMLLIST=htmllist

#
# rules
#
all: NMZ.i

../../www-html-modified:
	$(MAKE) -C ../../ www-html-modified

$(HTMLLIST): ../../www-html-modified
	find $(WWWHTML) -type f | grep -v 0MultiFileIdx > $(HTMLLIST)
	
NMZ.i: $(HTMLLIST)
	rm -f NMZ.*[^ja]
	$(MKNMZ) -F $< $(URLROOT)/ $(WWWROOT) 

install: all
	mirrordir -v --no-netrc\
	--exclude-regexp '*CVS*'\
	--exclude-regexp '*Makefile'\
	. $(NMZIDX)

clean:
	rm -f NMZ.*[^ja] $(HTMLLIST)
