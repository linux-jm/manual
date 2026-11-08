PACKAGE_STRING = GNU coreutils
srcdir = ../source
DEST = ../draft/man1

FILES = $(sort $(wildcard *.x))
MANPAGES = $(patsubst %.x,%.1,$(FILES))

LANG = ja_JP.UTF-8
# 1.50.1 --locale=a_JP.UTF-8  option not work
# HELP2MAN = /home/ribbon/.local/bin/help2man
HELP2MAN = /usr/local/bin/help2man
LN_S = ln -s
INSTALL = install
AM_V_GEN = @echo "  GEN     " $@;

.SUFFIXES: .x .1

# Ensure that help2man runs the ../src/ginstall binary as
# 'install' when creating install.1.
# Similarly, ensure that it uses the ../src/[ binary to create test.1.
t = $*.td
mapped_name = `echo $*|sed 's/^install$$/ginstall/; s/^test$$/[/'`

all:	build-man

build-man:	$(MANPAGES)

install:	build-man
	$(INSTALL) --mode=644 $(MANPAGES) $(DEST)

clean:
	$(RM) $(MANPAGES)

$(MANPAGES):	$(srcdir)/locale/ja/LC_MESSAGES/coreutils.mo

.x.1:
	$(AM_V_GEN)rm -f $@ $@-t			\
	&& {						\
	     rm -rf $t;					\
	     mkdir $t;					\
	     sed -e '/^\.\\\"O/d' ./$*.x > $t/$*.x;	\
	     (cd $t && $(LN_S) ../$(srcdir)/src/$(mapped_name) $*); \
	     ( LD_PRELOAD=/usr/local/lib64/help2man/bindtextdomain.so; \
	     export TEXTDOMAIN=help2man;                 \
	     export LOCALEDIR=/usr/local/share/locale;  \
	     $(HELP2MAN)				\
		--locale=$(LANG)			\
	        --source='$(PACKAGE_STRING)'		\
	        --include=$t/$*.x			\
		--include=translate.txt			\
	        --output=$t/$@ $t/$*;			\
	     )						\
	}						\
	&& sed 's|$*\.td/||g' $t/$@ > $@-t		\
	&& rm -rf $t					\
	&& chmod -w $@-t				\
	&& mv $@-t $@
