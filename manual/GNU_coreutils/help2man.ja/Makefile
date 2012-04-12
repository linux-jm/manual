NAME = coreutils
V = 8.16

LANG = ja_JP.UTF-8
HELP2MAN = /usr/bin/help2man
LN_S = ln -s
INSTALL = install
AM_V_GEN = @echo "  GEN     " $@;

FILES = $(wildcard *.x)
MANPAGES = $(patsubst %.x,%.1,$(FILES))
DEST = ../draft/man1

# You must compile coreutils in advance.
# Use 'make all_programs' to compile binaries which are not
# compiled in default (like arch, hostname).
#srcdir = $(HOME)/JM-work/coreutils-8.16
srcdir = ./$(NAME)-$(V)
tarball = $(NAME)-$(V).tar.xz

PACKAGE_NAME = GNU $(NAME)
PACKAGE_VERSION = $(V)
PACKAGE_STRING = $(PACKAGE_NAME) $(PACKAGE_VERSION)

.SUFFIXES: .x .1

# Ensure that help2man runs the ../src/ginstall binary as
# 'install' when creating install.1.
# Similarly, ensure that it uses the ../src/[ binary to create test.1.
t = $*.td
mapped_name = `echo $*|sed 's/^install$$/ginstall/; s/^test$$/[/'`

all:	build-man

tarball:	$(tarball)
$(tarball):
	wget http://core.ring.gr.jp/pub/GNU/coreutils/$@

stamp-setup:	$(tarball)
	tar xJf $^
	@(cd $(srcdir) \
	  && git init \
	  && git add . \
	  && git commit -m 'Import $(PACKAGE_NAME).' > /dev/null \
	)
	mkdir -p $(srcdir)/locale/$(LANG)/LC_MESSAGES
	touch $@

stamp-configure:	stamp-setup
	@(cd $(srcdir) && ./configure --localedir=`pwd`/locale)
	touch stamp-configure

stamp-build:	stamp-configure
	@(cd $(srcdir) \
	 && make \
	 && cd src \
	 && make all_programs \
	)
	touch $@

build-man:	$(MANPAGES)

$(MANPAGES):	stamp-build

install:	build-man
	$(INSTALL) --mode=644 $(MANPAGES) $(DEST)

clean:
	$(RM) $(MANPAGES)

clean-build:
	(cd $(srcdir) && make distclean)
	$(RM) stamp-configure stamp-build

clean-setup:
	$(RM) -r $(srcdir)
	$(RM) stamp-setup stamp-configure stamp-build

realclean:	clean-setup clean

.x.1:
	$(AM_V_GEN)rm -f $@ $@-t					\
	&& {						\
	     rm -rf $t;					\
	     mkdir $t;					\
	     sed -e '/^\.\\\"O/d' ./$*.x > $t/$*.x;	\
	     (cd $t && $(LN_S) ../$(srcdir)/src/$(mapped_name) $*); \
	        $(HELP2MAN)				\
		--locale=$(LANG)			\
	        --source='$(PACKAGE_STRING)'		\
	        --include=$t/$*.x			\
	        --output=$t/$@ $t/$*;			\
	}						\
	&& sed 's|$*\.td/||g' $t/$@ > $@-t		\
	&& rm -rf $t					\
	&& chmod -w $@-t				\
	&& mv $@-t $@
