#!/usr/bin/perl
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

if (@ARGV < 3) {die "$0 manroot wwwroot pkglist\n"};

my $MANROOT = $ARGV[0];
unless (-d $MANROOT) {die "$MANROOT does not exist\n"};

my $WWWROOT = $ARGV[1];
unless (-d $MANROOT) {die "$WWWROOT does not exist\n"};

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
    if (/^#/) {next;}
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
    my %tl;
    my %ps;
    my $version;

    open TL, "sort -t : -k 5 $MANROOT/$dir/translation_list |" or die "cannot open $dir/translation_list";
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

    print "<H3><A NAME=\"$dir\">$pkg</A> <SMALL>(Version $version)</SMALL></H3>\n";

    foreach $sec (sort keys %tl){
#	print "<H4>セクション $sec</H4>\n";
	print "<P CLASS=\"noindent\">\n";

	foreach my $i (0 .. $#{$tl{$sec}}){
	    my %ti = line2hash(${ $tl{$sec} }[$i]);
            my $kind = $ti{'kind'};
	    my $stat = $ti{'stat'};
	    my $name = $ti{'fname'};

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
}

