#!/usr/bin/perl
#
# $Id: list_progress.perl,v 1.5 2008/12/23 17:24:40 motoki Exp $
#
BEGIN{
    my $epath = `dirname $0`; chomp $epath;
    my $lpath = "$epath/../../bin";
    unshift (@INC, $lpath);
}
use JMtl ('line2hash');
use strict 'vars';

my $HTML = "../html";
my $ROFF = "../manual";
my $POD  = "../pod";
my %tl;

#
# $CVSROOT は CVS リポジトリの トップ.
#
if (@ARGV < 1) {die "$0 cvsroot\n"};

my $CVSROOT = $ARGV[0];
unless (-d $CVSROOT) {die "$CVSROOT does not exist\n"};

open TL, "cat `find $CVSROOT/manual -name translation_list` |";
while (<TL>){
    chomp;
    my %ti = line2hash($_);
    if ($ti{'kind'} ne 'roff') { next;}

    my $stat = $ti{'stat'};
    if ($stat =~ /^up2/) {next;}
    if ($stat eq "cnt_upd") {next;}

    push @{ $tl{$ti{'pkg'}} }, $_;
}
close TL;

open TL, "cat `find $CVSROOT/pod -name translation_list` |";
while (<TL>){
    chomp;
    my %ti = line2hash($_);
    if ($ti{'kind'} ne 'roff') { next;}

    my $stat = $ti{'stat'};
    if ($stat =~ /^up2/) {next;}
    if ($stat eq "cnt_upd") {next;}

    push @{ $tl{$ti{'pkg'}} }, $_;
}
close TL;

my ($key, $pkg);


print "<H2>ステータス一覧</H2>\n";

print "<H3>目次</H3>\n";
print "<UL>\n";
foreach $key (sort keys %tl){
    $pkg = $key; $pkg =~ s/ /_/eg;
    print "<LI><A HREF=\"#$pkg\">$key</A></LI>\n";
}
print "</UL>\n";


foreach $key (sort keys %tl){
    $pkg = $key; $pkg =~ s/ /_/eg;
    print "<H3><A NAME=\"$pkg\">$key</A></H3>\n";
    print "<DL>\n";
    my $i;
    foreach $i (0 .. $#{$tl{$key}}){
	my %ti = line2hash(${$tl{$key}}[$i]);
	my $stat = $ti{'stat'};
	my $pkg  = $ti{'pkg'};
	my $dir  = $pkg; $dir =~ s/ /_/eg;
	my $name = $ti{'fname'};
	my $sec  = $ti{'sec'};
	my $comment = $ti{'comment'};

        my ($base, $loc);
        if ($sec ne "pod"){
	    $base = $ROFF;
	    $loc = "man$sec/$name.$sec";
	} else {
	    $base = $POD;
	    $loc = "$name.pod";
	}

	print "<DT>$ti{'mark'}\n";
	print "<STRONG>$name.$sec</STRONG>\n";
	print "<A HREF=\"$base/$dir/original/$loc\">original</A>\n";
	if ($stat =~ /dft/ || $stat =~ /prf/){
	    print "<A HREF=\"$base/$dir/draft/$loc\">draft</A>\n";
	}
	if ($stat =~ /^upd/){
	    print "<A HREF=\"$base/$dir/release/$loc\">prev. release</A>\n";
	}
	if ($stat eq "cnt_old"){
	    print "<A HREF=\"$base/$dir/contrib/$loc\">prev. contrib</A>\n";
	}

	if ($comment ne ""){
	    print "<SMALL>$comment</SMALL>\n";
	}
	print "</DT>\n";

	if ($stat =~ /rsv/ || $stat =~ /prf/){
	    print "<DD>\n";

	    my $pmail;
	    $pmail = $ti{'pmail'};
	    if ($pmail eq "") {$pmail = $ti{'tmail'}};
	    if ($pmail eq undef){print "<!--PMAIL-->\n";}
	    # Escape email address
	    $pmail =~ s/\@/ ＠ /;
	    print "Reserved by $pmail ($ti{'tdat'})\n";

	    print "</DD>\n\n";
	}
    }
    print "</DL>\n\n\n";
}

