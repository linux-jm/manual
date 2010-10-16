# $Id: Makefile,v 1.1 1999/10/12 16:19:42 nakano Exp $

M4 = m4 -P

OBJ = objective welcome guide

all: $(OBJ)

objective: objective.m4 messages.m4
	$(M4) objective.m4 | nkf -j > $@

welcome: welcome.m4 messages.m4
	$(M4) welcome.m4 | nkf -j > $@

guide: guide.m4 messages.m4
	$(M4) guide.m4 | nkf -j > $@

clean:
	rm -f $(OBJ)
