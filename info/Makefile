SUBDIRS = GNU_coreutils

html:
	for dir in $(SUBDIRS); do \
	  make -C $$dir $@; \
	done

install:
	for dir in $(SUBDIRS); do \
	  make -C $$dir $@; \
	done

clean:
	for dir in $(SUBDIRS); do \
	  make -C $$dir $@; \
	done
