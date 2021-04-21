NAME = coreutils
V = 8.32

DEST = draft/man1

# You must compile coreutils in advance.
srcdir = ./$(NAME)-$(V)
tarball = $(NAME)-$(V).tar.xz

PACKAGE_NAME = GNU $(NAME)
PACKAGE_VERSION = $(V)
PACKAGE_STRING = $(PACKAGE_NAME) $(PACKAGE_VERSION)

all:	build-man
source:	stamp-build

#------------------------------------------------------------

tarball:	$(tarball)
$(tarball):
	wget http://core.ring.gr.jp/pub/GNU/coreutils/$@

stamp-setup:	$(tarball)
	tar xJf $^
	ln -s $(srcdir) source
	@(cd source \
	  && git init \
	  && git add . \
	  && git commit -m 'Import $(PACKAGE_NAME).' > /dev/null \
	)
	mkdir -p source/locale/ja/LC_MESSAGES
	@set -e ; if [ -f patch-$(V).diff ]; then \
	  patch -p0 < patch-$(V).diff; \
	fi
	@set -e ; if [ -f ja.po/ja.po.$(V) ]; then \
	  rm -f source/po/ja.po; \
	  ln -s ../../ja.po/ja.po.$(V) source/po/ja.po; \
	  echo "Use JM-maintained ja.po for translation."; \
	else \
	  echo "No JM-maintained ja.po found for $(V)."; \
	fi
	touch $@

stamp-configure:	stamp-setup
	@(cd source && ./configure --localedir=`pwd`/locale)
	touch stamp-configure

stamp-build:	stamp-configure
	@(cd source \
	 && make \
	 && make src/arch \
	 && make src/coreutils \
	 && make src/hostname \
	 && make man/arch.1 \
	 && make man/coreutils.1 \
	 && make man/hostname.1 \
	)
	touch $@

#------------------------------------------------------------

mo-ja = source/locale/ja/LC_MESSAGES/coreutils.mo
gmo-ja = source/po/ja.gmo
po-ja = source/po/ja.po

$(mo-ja):	$(gmo-ja)
	/bin/cp $^ $@

$(gmo-ja):	$(po-ja)
	$(MAKE) -C source/po $$(basename $@)

catalog:	$(mo-ja)

build-man:	stamp-build catalog
	$(MAKE) -C help2man.ja $@ PACKAGE_VERSION=$(PACKAGE_VERSION)

install:	build-man
	$(MAKE) -C help2man.ja $@

clean:
	$(MAKE) -C help2man.ja $@

clean-build:
	(cd source && make distclean)
	$(RM) stamp-configure stamp-build

clean-setup:
	$(RM) -r $(srcdir)
	$(RM) source
	$(RM) stamp-setup stamp-configure stamp-build

realclean:	clean-setup clean

#------------------------------------------------------------

MAN2HTML = ../../admin/man-1.6g/man2html/man2html

html:	html-setup html-gen html-index

html-setup:
	@set -e; if [ ! -e html ]; then \
	  echo "  MKDIR    html."; \
	  mkdir html; \
	fi; \
	for d in draft/man?; do \
	  dm=html/$$(basename $$d); \
	  echo "  MKDIR    $$dm"; \
	  mkdir -p $$dm; \
	done

html-gen:
	@set -e; for f in draft/man?/*.[1-8]; do \
	  n=$$(basename $$f); \
	  t=$$(echo $$f | cut -d / -f 2-3); \
	  o=original/$$t; \
	  echo "  GEN      html/$${t}.html"; \
	  $(MAN2HTML) $$f | tail -n +3 > html/$${t}.draft.html; \
	  $(MAN2HTML) $$o | tail -n +3 > html/$${t}.orig.html; \
	  printf "<html>\n" > html/$${t}.html; \
	  printf "<head><title>$$n</title></head>\n" >> html/$${t}.html; \
	  printf "<frameset cols=\"50%%,50%%\">\n" >> html/$${t}.html; \
	  printf "  <frame src=\"$$n.orig.html\" name=\"orig\" />\n" >> html/$${t}.html; \
	  printf "  <frame src=\"$$n.draft.html\" name=\"draft\" />\n" >> html/$${t}.html; \
	  printf "</frameset></html>\n" >> html/$${t}.html; \
	done

html-index:
	@set -e; echo "  GEN      index.html"; \
	idx=html/index.html; \
	printf "<html><head><title>" > $$idx; \
	printf "Drafts of $(PACKAGE_STRING)</title></head>\n" >> $$idx; \
	printf "<body><h1>Drafts of $(PACKAGE_STRING)</h1>\n<ul>\n" >> $$idx; \
	for f in draft/man?/*.[1-8]; do \
	  t=$$(echo $$f | cut -d / -f 2-3).html; \
	  printf "<li><a href=\"$$t\">$$(basename $$f)</a></li>\n" >> $$idx; \
	done; \
	printf "</ul><hr>$$(LC_ALL=C date)</body></html>\n" >> $$idx
