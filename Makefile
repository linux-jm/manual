#
# $Id: Makefile,v 1.37 2007/11/19 05:29:25 nakano Exp $
#
# Build macro for JM project.  If something don't work well,
# please refer the description in admin/JM-CVS/JM-CVS.sgml.
#
include ./JM.rules

#
# defs
#
MKRWWW=bin/mkmanweb.perl
MKPWWW=bin/mkpodweb.perl
MKDIST=bin/mkdist.perl
MKSPDIST=bin/mksplitdist.perl
CHKCVS=bin/chkcvs.sh

ROFFSRC=./manual
PODSRC=./pod

JMVER=0.5
JMRELEASE := $(shell date +"%Y%m%d")
DIST := man-pages-ja-$(JMRELEASE)

JMRPMDIST := jman_pages-$(JMVER)-$(JMRELEASE)
JMRPMSRC := $(TMPDIR)/$(DIST).tar.gz
JMRPMSPEC=jman_pages.spec
JMRPM_BUILD_ROOT=$(TMPDIR)/man-pages-ja-root

#
# global rules
#
periodic: chkcvs roff html web cgi

all: periodic archive-install 

#
# update check for CVS checkout
#
chkcvs:
	$(CHKCVS)

cvs-release-modified cvs-status-modified: chkcvs

#
# roff tree
#
roff: www-roff-modified

www-roff-modified: cvs-status-modified
	@mkdir -p $(WWWROFF)
	$(RSYNC) -a $(ROFFSRC)/ $(WWWROFF)
	@mkdir -p $(WWWPOD)
	$(RSYNC) -a $(PODSRC)/ $(WWWPOD)
	touch $@

#
# html tree
#
html: www-html-modified

www-html-modified: cvs-release-modified
	-$(RM) -rf $(WWWHTML)
	mkdir -p $(WWWHTML)
	$(MKRWWW) $(ROFFSRC) $(WWWHTML) $(MAN2HTML)
	$(MKPWWW) $(PODSRC) $(WWWHTML) $(POD2HTML)
	touch $@

#
# web & cgi contents
#
web:
	$(MAKE) -C www/\
		WWWROOT=$(WWWROOT) CGIROOT=$(CGIROOT) WORKDIR=$(TMPDIR)\
		install

cgi:
	$(MAKE) -C admin/cgi/\
		WWWROOT=$(WWWROOT) CGIROOT=$(CGIROOT)\
		install

#
# archive related rules
#
archive-install: latest-archive-modified
	-$(RM) www/man-pages-ja-*.tar.gz www/per-pkg/*.gz
	-$(RM) www/rpm/*.rpm
	cp $(TMPDIR)/$(DIST).tar.gz www/
	mkdir -p www/per-pkg
	cp $(TMPDIR)/man-pages-ja-*-$(JMRELEASE).tar.gz www/per-pkg
	mkdir -p www/rpm
	-cp $(RPMROOT)/RPMS/noarch/$(JMRPMDIST).noarch.rpm www/rpm
	-cp $(RPMROOT)/SRPMS/$(JMRPMDIST).src.rpm www/rpm
	touch $<
	make -C www/ DATE=$(JMRELEASE)\
		WWWROOT=$(WWWROOT) CGIROOT=$(CGIROOT)\
		download.html index.html
	make -C www/\
		WWWROOT=$(WWWROOT) CGIROOT=$(CGIROOT)\
		install

latest-archive-modified: tarball rpm

#
# tarball
#
tarball: $(TMPDIR)/$(DIST).tar.gz

$(TMPDIR)/$(DIST).tar.gz:
	$(MKDIST) . $(TMPDIR)/$(DIST) $(POD2MAN)
	$(MAKE) -f Makefile.dist install
	(cd $(TMPDIR); tar czf $(DIST).tar.gz $(DIST))
	$(MKSPDIST) $(TMPDIR)/$(DIST)
	touch latest-archive-modified

#
# rpm
#
rpm: $(RPMROOT)/RPMS/noarch/$(JMRPMDIST).noarch.rpm

$(RPMROOT)/RPMS/noarch/$(JMRPMDIST).noarch.rpm: $(JMRPMSRC)
	mkdir -p $(RPMROOT)/SOURCES
	mkdir -p $(RPMROOT)/SPECS
	mkdir -p $(RPMROOT)/BUILD
	mkdir -p $(RPMROOT)/RPMS/noarch
	mkdir -p $(RPMROOT)/SRPMS
	mkdir -p $(RPMROOT)/db
	cp $(JMRPMSRC) $(RPMROOT)/SOURCES/
	sed     -e "s/@@version@@/$(JMVER)/" \
		-e "s/@@release@@/$(JMRELEASE)/" \
		-e "s%@@buildroot@@%$(JMRPM_BUILD_ROOT)%" \
	    www/rpm/$(JMRPMSPEC) > $(RPMROOT)/SPECS/$(JMRPMSPEC)
	$(RPM) --dbpath $(RPMROOT)/db --rebuilddb
	$(RPMB) --define "buildroot $(JMRPM_BUILD_ROOT)" \
	    --dbpath $(RPMROOT)/db \
	    --define "_topdir $(RPMROOT)"  \
	    --define "_mandir /usr/share/man" -ba \
	    $(RPMROOT)/SPECS/$(JMRPMSPEC)
	touch latest-archive-modified

#
# clean
#
clean:
	rm -f *-modified
	rm -rf $(TMPDIR)
	$(MAKE) -C admin/cgi/ clean
	$(MAKE) -C www/ clean
	$(MAKE) -f Makefile.dist clean
	rm -rf $(JMRPM_BUILD_ROOT)
	rm -rf $(RPMROOT)/BUILD/$(DIST)
	for i in $(JMRPMSRC); do \
	    rm -f $(RPMROOT)/SOURCES/`basename $$i` ; \
	done

