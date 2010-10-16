#!/usr/bin/perl
#
# $Id: link-partial-archives.perl,v 1.6 2005/09/16 13:42:31 nakano Exp $
# download.html 用のアーカイブリンクエントリを作る. (分割用)
#
use File::Basename;
$ENV{"LANG"}="C";

#
#yes, it's an ugly hack...
#
if (! -f "per-pkg/man-pages-ja-LDP_man-pages-$ARGV[0].tar.gz") {
    print "<P>\n Sorry, Archives are unavailable now\n</P>\n";
    exit 0;
}

@fpaths = glob("per-pkg/man-pages-ja-*-$ARGV[0].tar.gz");
print "<UL>\n";
foreach $fpath (@fpaths){

    @STAT = stat $fpath;
    $fkbytes = int($STAT[7]/1024);

    @gt      = gmtime($STAT[9]);
    $fdate   = sprintf "%4d-%02d-%02d", $gt[5]+1900, $gt[4]+1, $gt[3]+1;

    $fname = basename($fpath);

    print " <LI><A HREF=\"$fpath\">$fname</A>\n";
    print "  <SMALL>($fkbytes kbytes: $fdate)</SMALL></LI>\n";
}
close LS;
print "</UL>\n";

