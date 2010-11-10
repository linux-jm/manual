#
# Makefile for contents in www/status
#
include ../../JM.rules

ifndef WORKDIR
   WORKDIR = /var/tmp/JM
endif

JMPOST = ../../admin/JMpost
JMMANVIEW = ../../admin/JM-man-view.el

TARGET = index.html mailformat.html translation_note.html\
	repository.html pod.html JM-man-view.html

.SUFFIXES: .m4 .html

.m4.html:
	m4 -P -D _WORKDIR=$(WORKDIR) -D _WWWROOT=$(WWWROOT) $*.m4\
	| nkf -j > $*.html

all: $(TARGET)

*.html: ../jm_www.m4

clean:
	@rm -f $(TARGET)

install: all
	-mkdir -p $(WWWROOT)/guidance
	cp $(JMPOST) $(WWWROOT)/guidance
	cp $(JMMANVIEW) $(WWWROOT)/guidance

