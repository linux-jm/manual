#!/usr/bin/perl -w
#
# build html hierarchy of pod files using pod2html
#
# $Id: mkpodweb.perl,v 1.2 2000/08/02 10:00:22 nakano Exp $
#
BEGIN{
    $epath = `dirname $0`; chomp $epath;
    unshift (@INC, $epath);
}
use JMtl ('line2hash', 'hash2line');
use strict 'vars';

my ($idx_header, $idx_footer);

#
# $PODROOT は CVS リポジトリの JM/pod,
# $WWWROOT は web の html コンテンツのトップ,
# $POD2HTML は pod2html コマンドを想定.
#
if (@ARGV < 3) {die "$0 srcroot destroot pod2html\n"};

my $PODROOT = $ARGV[0];
unless (-d $PODROOT) {die "$PODROOT does not exist\n"};

my $WWWROOT = $ARGV[1];

my $POD2HTML = $ARGV[2];
unless (-x $POD2HTML) {die "$POD2HTML does not executable\n"};

#
# for debugging purpose:
#
#my $PODROOT = "/home/nakano/text/JM/imp/pod";
#my $WWWROOT = "/home/nakano/public_html/JMwww/html";
#my $MAN2HTML = "/home/nakano/bin/man2html";
#my $YAMAN2HTML = "/home/nakano/text/JM/head/admin/tools/yaman2html.perl";

#
# man2html 出力に対して置換する各リンク (決め打ち(^^;)
#
my $PODWROOT='../../pod';
my $MAIN='<A HREF="../../index.html">JM Home Page</A>';
my $CSS='<LINK REL="stylesheet" TYPE="text/css" HREF="../../jmpod.css">';

my (%pod_hash, %page_name);
#
# $PODROOT/$pkg/translation_list の scan.
#
print "scanning translation_list's...\n";
open RL,"find $PODROOT -name translation_list|";
while(<RL>){
    print;
    chomp;
    my $tl = $_;
    unless(/.*pod\/([^\/]*)\/translation_list/){next;}
    my $pkg=$1;

    open TL, $tl || die "cannot open $tl";
    while (<TL>){
	print;
	chomp;
	my %ti = line2hash($_);
	my $name = $ti{fname};
	my $page = "$pkg,$name";

	if ($ti{kind} eq "roff" && $ti{stat} =~ /^up/) {
	    my $src = "$pkg/release/$name.pod";
	    $pod_hash{"$page"} = $src;
	    print "collect pod: $page <= $src\n";
	    next;
	}

	if ($ti{kind} eq "roff" && $ti{stat} =~ /^cnt/) {
	    my $src = "$pkg/contrib/$name.pod";
	    $pod_hash{"$page"} = $src;
	    print "collect pod: $page <= $src\n";
	    next;
	}
    }
    close TL;
}
close RL;

foreach my $key (sort keys %page_name){
    my $num = $#{$page_name{$key}} + 1;
    print "$key: $num\n";
}
#
# 変換開始。
#

#
# roff -> html
#
foreach my $fkey (sort keys %pod_hash){
    my ($pkg, $name) = split /,/, $fkey;

    my $hdir = "$WWWROOT/$pkg";
    my $hfile = "$hdir/$name.pod.html";

    system("mkdir -p $hdir");

    print "converting $pkg/$name.pod...";
    my $podpage = "$PODROOT/$pod_hash{$fkey}";

    # pod page への link.
    my $PODP = "<A HREF=\"$PODWROOT/$pod_hash{$fkey}\">pod page</A>";
    my $NAVI = "$MAIN\n$PODP";

    open P2H, "$POD2HTML $podpage |";
    open WL,"| nkf -j > $hfile";

    while(<P2H>){
	s/\<\/HEAD\>/$CSS\n<HEAD>\n/;
	s/<BODY>/<BODY>$NAVI\n<HR>\n/;

	# Fix double quotes
	s/\`\`/\&#147;/g;
	s/\'\'/\&#148;/g;

	# Fix single quotes
	s/\'/\&#146;/g;

	# Fix em-dashes... It may not be parsed well by JP browsers.
	# s/---/\&#151;/g;

	# Add </P> to the end of paragraphs
	if (/^\<P\>/ .. /^$/)
	{
	    print WL "</P>\n" if (/^$/);
	}
        print WL;
    }
    close P2H;
    close WL;
    system ("rm -f pod2html-*cache");
    print "done.\n";
}

