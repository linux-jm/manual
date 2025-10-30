#
# Makefile for contents in www/announcement.
#

SRCS = $(wildcard *.m4)
#OBJS = index.html 19991015.html 20001120.html
OBJS = $(patsubst %.m4, %.html, $(SRCS))

.SUFFIXES: .m4 .html

.m4.html:
	m4 -P $*.m4 > $*.html

default: $(OBJS)

clean:
	rm -f $(OBJS)

check:
	@echo $(SRCS)
	@echo $(OBJS)
