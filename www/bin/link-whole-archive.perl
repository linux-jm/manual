#!/usr/bin/perl
#
# $Id: link-whole-archive.perl,v 1.6 2005/09/16 13:42:31 nakano Exp $
# download.html 用のアーカイブリンクエントリを作る. (全体用)
#
use File::Basename;
$ENV{"LANG"}="C";

$fpath = "man-pages-ja-$ARGV[0].tar.gz";

if (! -f $fpath) {
    print "Sorry, Archive is unavailable now\n";
    exit 0;
}

@STAT = stat $fpath;
$fkbytes = int($STAT[7]/1024);

@gt      = gmtime($STAT[9]);
$fdate   = sprintf "%4d-%02d-%02d", $gt[5]+1900, $gt[4]+1, $gt[3]+1;

$fname = basename($fpath);

print "<A HREF=\"$fpath\">$fname</A>\n";
print "<SMALL>($fkbytes kbytes: $fdate)</SMALL>\n";

