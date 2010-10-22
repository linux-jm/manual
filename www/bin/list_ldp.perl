#!/usr/bin/perl
# $Id: list_ldp.perl,v 1.4 2001/03/14 14:20:16 uchida Exp $
#
#
# $MANROOT は CVS リポジトリの JM/manual,
# $WWWROOT はインストール先ディレクトリ.
#
BEGIN{
    my $epath = `dirname $0`; chomp $epath;
    my $lpath = "$epath/../../bin";
    unshift (@INC, $lpath);
}
use JMtl ('line2hash');

if (@ARGV < 2) {die "$0 manroot wwwroot\n"};

my $MANROOT = $ARGV[0];
unless (-d $MANROOT) {die "$MANROOT does not exist\n"};

my $WWWROOT = $ARGV[1];
unless (-d $MANROOT) {die "$WWWROOT does not exist\n"};

my $HTML = "$WWWROOT/html";
my $ROFF = "$WWWROOT/manual";

my %tl;
my %ps;
#
# セクション内アルファベット分割の閾値
#
my $splitmin = 40;
my $version;

open TL, "sort -t : -k 5 $MANROOT/LDP_man-pages/translation_list |";
while (<TL>){
    chomp;
    my %ti = line2hash($_);
    my $name = $ti{'fname'};
    my $sec  = $ti{'sec'};
    $version = $ti{'over'};

    # so ファイル用に、 roff ファイルの status を store.
    #
    if ($ti{'kind'} eq 'roff') {
	$ps{"$name.$sec"} = $ti{'stat'};
    }

    push @{ $tl{$sec} }, $_;
}
close TL;


print "<H2>ページ一覧 : LDP_man-pages <SMALL>(Version $version)</SMALL></H2>\n";

print "<H3>目次</H3>\n";
print "<UL>\n";
foreach $sec (sort keys %tl){
    print "<LI><A HREF=\"#sec$sec\">セクション $sec</A></LI>\n";
}
print "</UL>\n";


foreach $sec (sort keys %tl){
    print "<H3><A NAME=\"sec$sec\">セクション $sec</A></H3>\n";

    my $hl = "z";
    if ($#{$tl{$sec}} > $splitmin){
	my %ti = line2hash(${ $tl{$sec} }[0]);
	$hl = substr $ti{'fname'}, 0, 1;

	if ($hl lt 'a') {
		$hl = '_';
		print "<H4>A-Z, 記号</H4>\n";
	} else {
		print "<H4>$hl</H4>\n";
	}
    }

    print "<P CLASS=\"noindent\">\n";

    my $i;
    foreach $i (0 .. $#{$tl{$sec}}){
	my %ti = line2hash(${ $tl{$sec} }[$i]);
        my $kind = $ti{'kind'};
	my $stat = $ti{'stat'};
	my $pkg  = $ti{'pkg'};
	my $dir  = $pkg; $dir =~ s/ /_/eg;
	my $name = $ti{'fname'};

	my $hlc = substr($name, 0, 1);
	if ($hlc gt $hl) {
	    $hl = $hlc;
	    print "</P>\n\n";
	    print "<H4>$hl</H4>\n";
	    print "<P CLASS=\"noindent\">\n";
	}

	my $fname = "$name.$sec";

	if ($kind eq 'so' && $stat eq 'up2date'){
	    my $lname = $ti{'lname'};
	    my $lsec = $ti{'lsec'};

	    $stat = $ps{"$lname.$lsec"};
	}

	if ($stat =~ /up2/ || $stat eq "cnt_upd"){
	    $fname = "<STRONG>$name.$sec</STRONG>";
	} elsif ($stat =~ /upd/) {
	    $fname = "$name.$sec";
	}
	
	my $htmlpath = "$dir/man$sec/$name.$sec.html";

	if ( -f "$HTML/$htmlpath" ) {
	    print "<A HREF=\"../html/$htmlpath\">$fname</A>";
	} else {
	    print "$fname";
	}

	print "\n";
    }
    print "</P>\n\n";
}

