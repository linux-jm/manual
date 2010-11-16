include ../../JM.rules

SITEMAP = sitemap.xml
CONTENTS = robots.txt $(SITEMAP) google*.html

all:	install

$(SITEMAP):    ../../stamp/www-html-modified
	$(RM) $(SITEMAP)
	./gen_sitemap.rb $(WWWROOT) > $(SITEMAP)

install: $(SITEMAP)
	$(RSYNC) -a --delete -v $(CONTENTS) $(WWWROOT)
