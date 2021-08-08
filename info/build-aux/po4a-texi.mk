texi_sources = $(texi_source_main) $(texi_source_others)

original_source_main   = ${addprefix original/texi/,$(texi_source_main)}
original_source_others = ${addprefix original/texi/,$(texi_source_others)}
original_sources       = $(original_source_main) $(original_source_others)

ifdef PACKAGE_SUBNAME
  po_source              = po4a/texi/$(PACKAGE_SUBNAME).po
  target_htmldir         = draft/html/$(PACKAGE_SUBNAME)
  target_info            = draft/info/$(PACKAGE_SUBNAME).info
  target_plaintext       = draft/text/$(PACKAGE_SUBNAME).txt
  target_pdf             = draft/pdf/$(PACKAGE_SUBNAME).pdf
  target_pod             = draft/pod/$(PACKAGE_SUBNAME).pod
else
  po_source              = po4a/texi/ja.po
  target_htmldir         = draft/html
  target_info            = draft/info/$(PACKAGE_NAME).info
  target_plaintext       = draft/text/$(PACKAGE_NAME).txt
  target_pdf             = draft/pdf/$(PACKAGE_NAME).pdf
  target_pod             = draft/pod/$(PACKAGE_NAME).pod
endif

target_source_main     = ${addprefix draft/texi/,$(texi_source_main)}
target_source_others   = ${addprefix draft/texi/,$(texi_source_others)}
target_sources         = $(target_source_main) $(target_source_others)

target_html            = $(target_htmldir)/index.html
target_man             = draft/man/man1/$(PACKAGE_NAME).1

POTFILE=po4a/texi/$(PACKAGE_NAME)-texi.pot
ifdef PACKAGE_SUBNAME
  POFILE=po4a/texi/$(PACKAGE_SUBNAME).po
else
  POFILE=po4a/texi/ja.po
endif

.DEFAULT_GOAL := all
all: extra_texi info #html text pdf

info: $(target_info)
$(target_info): $(target_sources)
	makeinfo -o $@ $(target_source_main)
#$(target_source_main): $(target_source_others)

original-info: $(original_sources)
	mkdir -p tmp/info
	makeinfo -o tmp/info/$(PACKAGE_NAME).info $<

html: $(target_html)
$(target_html): $(target_sources)
	makeinfo --html -o $(target_htmldir) $(target_source_main)

text: $(target_plaintext)
$(target_plaintext): $(target_sources)
	makeinfo --plaintext -o $@ $(target_source_main)

pdf: $(target_pdf)
$(target_pdf): texi
	mkdir -p draft/pdf
	cd draft/pdf && \
	  TEXINPUTS=../../../build-aux: PDFTEX=xetex texi2pdf ../../$(target_source_main)

$(target_sources): $(original_sources) $(po_source) $(PO4ACFG)
	po4a $(PO4AFLAGS) -v --previous $(PO4ACFG)
	@sed -i -e "s|$(PWD)/||g" $(POTFILE)
	@sed -i -e "s|$(PWD)/||g" $(POFILE)
	@sed -i -e "s/\(\\input texinfo\) /\1\-ja /" $(target_source_main)
	@touch $(target_sources)
$(po_source):
	po4a $(PO4AFLAGS) -v --previous $(PO4ACFG)
	@sed -i -e "s|$(PWD)/||g" $(POTFILE)
	@sed -i -e "s|$(PWD)/||g" $(POFILE)
	@sed -i -e "s/\(\\input texinfo\) /\1\-ja /" $(target_source_main)
	@touch $(target_sources)
#M#texibuild:

extra_texi::

pod: $(target_pod)
$(target_pod): $(target_source_main)
	@mkdir -p $(@D)
	$(eval VERSION=$(shell grep '^@set VERSION' draft/texi/version.texi | sed -e "s/\@set VERSION //"))
	@../build-aux/texi2pod.pl -D VERSION="$(VERSION)" $(target_source_main) $@

man: $(target_man)
$(target_man): $(target_pod)
	@mkdir -p $(@D)
	pod2man --center="$(FULL_PACKAGE_NAME)" --release="$(FULL_PACKAGE_NAME) $(PACKAGE_VERSION)" --utf8 $? > $@ || \
	pod2man --center="$(FULL_PACKAGE_NAME)" --release="$(FULL_PACKAGE_NAME) $(PACKAGE_VERSION)" $? > $@

stat:
	@echo -n $(po_source)": "
	@msgfmt --statistics -o /dev/null $(po_source)

clean:
	rm -f draft/pdf/$(PACKAGE_MAIN).{aux,cp,cps,fn,fns,log,tmp,toc}

.PHONY: all info html text dvi pdf texi texibuild extra_texi pod man stat clean
