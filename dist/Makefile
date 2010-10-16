#
# Makefile  for  man-pages-ja-0.4  1998-12-20
#

all: config

config:	./script/configure.perl
	perl -w $<

install: installman.sh
	sh $<

clean:
	@rm -f installman.sh
