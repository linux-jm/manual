NAME = coreutils
V = 8.16

DEST = draft/man1

# You must compile coreutils in advance.
# Use 'make all_programs' to compile binaries which are not
# compiled in default (like arch, hostname).
#srcdir = $(HOME)/JM-work/coreutils-8.16
srcdir = ./$(NAME)-$(V)
tarball = $(NAME)-$(V).tar.xz

PACKAGE_NAME = GNU $(NAME)
PACKAGE_VERSION = $(V)
PACKAGE_STRING = $(PACKAGE_NAME) $(PACKAGE_VERSION)

all:	build-man

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
	touch $@

stamp-configure:	stamp-setup
	@(cd source && ./configure --localedir=`pwd`/locale)
	touch stamp-configure

stamp-build:	stamp-configure
	@(cd source \
	 && make \
	 && cd src \
	 && make all_programs \
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

build-man:	catalog
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
