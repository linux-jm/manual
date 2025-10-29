#!/usr/bin/perl
#
# build distribution tree.
#
# first version Thu Aug 19 00:53:30 JST 1999
#     by Tenkou N. Hattori <tnh@aurora.dti.ne.jp>
#
BEGIN{
    $epath = `dirname $0`; chomp $epath;
    unshift (@INC, $epath);
}
use JMtl ('line2hash', 'hash2line');
use strict 'vars';

my ($idx_header, $idx_footer);
#
# $CVSROOT は CVS リポジトリの root,
# $DISTROOT は配布アーカイブイメージの root.
#
if (@ARGV < 2) {die "$0 srcroot dstroot\n"};

my $CVSROOT = $ARGV[0];
unless (-d $CVSROOT) {die "$CVSROOT does not exist\n"};

my $DISTROOT = $ARGV[1];

# for debugging purpose:
#
#my $MANROOT = "/home/nakano/text/JM/imp/manual";
#my $DISTROOT = "/var/tmp/JM/man-pages-ja";

#
# いったん $DISTROOT/manual をお掃除。
#
if (-d "$DISTROOT/manual") {
    system("rm -rf $DISTROOT/manual");
}
system("mkdir -p $DISTROOT/manual");

my (%roff_hash, %link_hash);
#
# $CVSROOT/manual/$pkg/translation_list の scan.
#
print "scanning translation_list's...\n";
open RL,"find $CVSROOT/manual -name translation_list|";
while(<RL>){
    print;
    chomp;
    my $tl = $_;

    unless(/.*manual\/([^\/]*)\/translation_list/){next;}
    my $pkg=$1;

    # release または contrib ディレクトリを持たないパッケージは処理対象としない
    if (! -d "$CVSROOT/manual/$pkg/release" && ! -d "$CVSROOT/manual/$pkg/contrib") {next;}

    system "mkdir -p $DISTROOT/manual/$pkg/";
    system "cp $tl $DISTROOT/manual/$pkg";

    open TL, $tl || die "cannot open $tl";
    while (<TL>){
	chomp;
	my %ti = line2hash($_);
	my $name = $ti{fname};
	my $sec = $ti{sec};
	my $page = "$pkg,$name,$sec";

	if ($ti{kind} eq "link" && $ti{stat} eq "up2date"){
	    my $dst = ".so man$ti{lsec}/$ti{lname}.$ti{lsec}";
	    $link_hash{"$page"} = $dst;
	    print "collect link: $page => $dst\n";
	    next;
	}

	if ($ti{kind} eq roff && $ti{stat} =~ /^up/) {
	    my $src = "$pkg/release/man$sec/$name.$sec";
	    $roff_hash{"$page"} = $src;
	    print "collect roff: $page <= $src\n";
	    next;
	}

	if ($ti{kind} eq roff && $ti{stat} =~ /^cnt/) {
	    my $src = "$pkg/contrib/man$sec/$name.$sec";
	    $roff_hash{"$page"} = $src;
	    print "collect roff: $page <= $src\n";
	    next;
	}
    }
    close TL;
}
close RL;

#
# copy 開始
#
foreach my $fkey (sort keys %roff_hash){
    my ($pkg,$name,$sec)=split /,/, $fkey;

    my $dstdir = "$DISTROOT/manual/$pkg/man$sec";
    my $dstfile = "$dstdir/$name.$sec";
    my $srcfile = "$CVSROOT/manual/$roff_hash{$fkey}";

    print "copy $srcfile => $dstfile\n";
    system "mkdir -p $dstdir";
    system "cp $srcfile $dstfile";
}

#
# make symlinks
#
foreach my $fkey (sort keys %link_hash){
    my ($pkg, $name, $sec) = split /,/, $fkey;

    my $dstdir = "$DISTROOT/manual/$pkg/man$sec";
    my $dstfile = "$dstdir/$name.$sec";

    print "cat \"$link_hash{$fkey}\" > $dstfile\n";
    system "mkdir -p $dstdir";
    open DF, "> $dstfile" || die "cannot open $dstfile\n";
    print DF "$link_hash{$fkey}\n";
    close DF;
}
