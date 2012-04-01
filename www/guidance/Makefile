#
# Makefile for contents in www/status
#
include ../../JM.rules

ifndef WORKDIR
   WORKDIR = /var/tmp/JM
endif

JMPOST = ../../admin/JMpost
JMPOST_WL = ../../admin/JMpost-wl.el
JMPOST_MEW = ../../admin/JMpost-mew.el
JMMANVIEW = ../../admin/JM-man-view.el

TARGET = index.html mailformat.html translation_note.html\
	repository.html pod.html JM-man-view.html
EXTRAS = JMpost JMpost-wl.el JMpost-mew.el JM-man-view.el

.SUFFIXES: .m4 .html

.m4.html:
	m4 -P -D _WORKDIR=$(WORKDIR) -D _WWWROOT=$(WWWROOT) $*.m4\
	| nkf -w > $*.html

all: $(TARGET) $(EXTRAS)

*.html: ../jm_www.m4

JMpost:        $(JMPOST)
	cp -p $< $@
JMpost-wl.el:        $(JMPOST_WL)
	cp -p $< $@
JMpost-mew.el:        $(JMPOST_MEW)
	cp -p $< $@

JM-man-view.el:        $(JMMANVIEW)
	cp -p $< $@

clean:
	@rm -f $(TARGET) $(EXTRAS)

install: all

