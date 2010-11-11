include ../../JM.rules

SITEMAP = sitemap.xml
CONTENTS = robots.txt $(SITEMAP) google*.html

all:	install

sitemap:
	$(RM) $(SITEMAP)
	./gen_sitemap.rb $(WWWROOT) > $(SITEMAP)

install: sitemap
	$(RSYNC) -a -v $(CONTENTS) $(WWWROOT)
