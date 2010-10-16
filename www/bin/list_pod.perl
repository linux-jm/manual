#!/usr/bin/perl
# $Id: list_pod.perl,v 1.3 2000/09/11 04:57:09 nakano Exp $
#
#
# $PODROOT は CVS リポジトリの JM/pod,
# $WWWROOT はインストール先ディレクトリ.
#
BEGIN{
    my $epath = `dirname $0`; chomp $epath;
    my $lpath = "$epath/../../bin";
    unshift (@INC, $lpath);
}
use JMtl ('line2hash');
use strict 'vars';

if (@ARGV < 3) {die "$0 podroot wwwroot pkglist\n"};

my $PODROOT = $ARGV[0];
unless (-d $PODROOT) {die "$PODROOT does not exist\n"};

my $WWWROOT = $ARGV[1];
unless (-d $WWWROOT) {die "$WWWROOT does not exist\n"};

my $HTML = "$WWWROOT/html";
my $ROFF = "$WWWROOT/manual";

my $PKGLIST = $ARGV[2];

#
# パッケージ内セクション分割の閾値
#
my $splitmin = 40;

my @pl;
open PL, $PKGLIST or die "cannot open $PKGLIST\n";
while (<PL>){
    chomp;
    if (/^$/) {next;}
    push @pl, $_;
}

my $j;

print "<H2>目次</H2>\n";
print "<UL>\n";
for $j (0 .. $#pl){
    my $dir = $pl[$j]; $dir =~ s/ /_/eg;
    print "<LI><A HREF=\"\#$dir\">$pl[$j]</A></LI>\n";
}
print "</UL>\n";


for $j (0 .. $#pl){
    my $pkg = $pl[$j];
    my $dir = $pkg; $dir =~ s/ /_/eg;
    my @pp;
    my %ps;

    print "<H3><A NAME=\"$dir\">$pkg</A></H3>\n";

    open TL, "sort -t : +4 $PODROOT/$dir/translation_list |" or die "cannot open $dir/translation_list";
    while (<TL>){
	chomp;
	my %ti = line2hash($_);

	my $name = $ti{'fname'};
	if ($ti{'sec'} ne 'pod'){die "not a pod entry!\n";}

	push @pp, $_;
    }
    close TL;
    
    print "<P CLASS=\"noindent\">\n";

    foreach my $i (0 .. $#pp){
	my %ti = line2hash($pp[$i]);
	my $kind = $ti{'kind'};
	my $stat = $ti{'stat'};
	my $name = $ti{'fname'};

	my $fname;
	if ($stat =~ /up2/ || $stat eq "cnt_upd"){
	    $fname = "<STRONG>$name.pod</STRONG>";
	} elsif ($stat =~ /upd/) {
	    $fname = "$name.pod";
	}

	my $htmlpath = "$dir/$name.pod.html";

	if ( -f "$HTML/$htmlpath" ) {
	    print "<A HREF=\"../html/$htmlpath\">$fname</A>";
	} else {
	    print "$fname";
	}
    }
    print "\n</P>\n\n";
}

