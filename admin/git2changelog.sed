#
# This sed script converts git log output to ChangeLog style.
# http://www.mail-archive.com/twmode-users@lists.sourceforge.net/msg00115.html
#
# Sample command line as follows:
# git log --topo-order --pretty=format:"=%ai%n%an%n<%ae>%n%n%s%n%b" | \
#    sed -f git-to-changelog.sed
#

/^[^=].\{72,\}/{
  :loop
  s/^\(.\{0,70\}[^ ]\) \(.*\)$/\t\1\n\2/
  T too-long
  P
  D
  b loop
  :too-long
  s/^/\t/
  b
}
s/^\([^=\t]\)/\t\1/
/^=/{
  s/^=\([^ ]*\) .*$/\1/
  N
  N
  s/\n/  /g
}
