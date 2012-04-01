# include ../JM.rules

.SUFFIXES: .m4 .html

.m4.html:
	m4 -P $*.m4 | nkf -w > $*.html

OBJS = jm-brs.html jm-brs.cgi

PKGS_LIST = ../../dist/script/pkgs.list

default: $(OBJS)

clean:
	@rm -f $(OBJS) *.html

jm-brs.html: jm-brs.pre.html jm-brs.post.html $(PKGS_LIST)
	awk -f pkgs_list2html.awk $(PKGS_LIST) \
		| cat -s jm-brs.pre.html - jm-brs.post.html \
		> $@

jm-brs.cgi: jm-brs.cgi.m4
	m4 -P $@.m4 | nkf -w > $@

*.html: ../jm_www.m4
*.cgi: ../jm_www.m4

