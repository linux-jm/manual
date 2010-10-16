#!/usr/bin/perl
#
# $Id: link-rpms.perl,v 1.7 2005/09/16 13:42:31 nakano Exp $
# download.html 用のアーカイブリンクエントリを作る. (rpm 用)
#
use File::Basename;
$ENV{"LANG"}="C";

$RPMBASE = "$ARGV[1]rpm/jman_pages-0.5-$ARGV[0]";

print "<UL>\n";
foreach $fpath ("$RPMBASE.noarch.rpm", "$RPMBASE.src.rpm") {
    if (! -f "$fpath") {
	if ($fpath =~ /src.rpm/){
	    print "<LI>Sorry, SRPM is unavailable now</LI>\n";
	} else {
	    print "<LI>Sorry, RPM is unavailable now</LI>\n";
	}
    } else {
        my @STAT = stat $fpath;
        $fkbytes = int($STAT[7]/1024);

        @gd      = gmtime($STAT[9]);
        $fdate   = sprintf "%4d-%02d-%02d", $gd[5]+1900, $gd[4]+1, $gd[3]+1;

	$fname = basename($fpath);

	print " <LI><A HREF=\"$fpath\">$fname</A>\n";
	print "  <SMALL>($fkbytes kbytes: $fdate)</SMALL></LI>\n";
    }
}
print "</UL>\n";

