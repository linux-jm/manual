About this repository
=====================

This is a forked version of perkamon project [1] repository [2].
It is forked to manage Linux JM (Japanese manual) project [3],
but the repository are frequently synced with the upsream.

* [1] http://perkamon.alioth.debian.org/
* [2] http://gitorious.org/perkamon/man-pages
* [3] http://linuxjm.sourceforge.jp/

Main differences
================

Only difference from the upstream is:

* to have entries for `mdoc.7` and `mdoc.samples.7` (mdoc style man pages)

How to import changes in the upstream
=====================================

How to merge upstream into this repository:

    $ git remote add upstream git://gitorious.org/perkamon/man-pages.git
    $ git merge upstream/master

How to update the target version of LDP man-pages
=================================================

1. Update the upstream version in Makefile:

        V = 3.78

2. Refresh working directories.
   This downloads a new version of man-pages tarball and recreate the working directory under **build/**:

        rm -f stamp-*
        make setup

3. Check if new man pages are added. If something is printed, please add it to an appropriate po4a cfg **po4a/\*/\*.cfg**:

        make print-new-files

4. Check if some pages have been removed.:

        make disable-removed

5. Finally commit:


Using git-submodule
===================

Migrate to git version
----------------------

First add man-pages.git as a submodule:

    $ git submodule add git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git man-pages-git

Next update Makefile. The version number should be set to the next version.:

    V = 3.78-git

Sample commit message:

    $ git commit -m 'Sync to git 80a7408 (upcoming 3.78)'

Move back to release
--------------------

Remove the submodule entry:

    $ git submodule deinit man-pages-git
    $ rm .gitmodules
    $ rm -rf man-pages-git

Then update Makefile to point the released version:

    V = 3.78

Sample commit message:

    $ git commit -m 'Remove man-pages-git submodule and set V to 3.78'
