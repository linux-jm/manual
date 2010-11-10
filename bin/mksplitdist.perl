#!/usr/bin/perl
#
# mksplitdist.perl:
#   $DISTROOT を見て package 毎に分割された tar ball を作成する
#   スクリプト。
#   $DISTROOT は MKDIST, MKSO された後の directory を想定している
#
# 起動例
#   mksplitdist.perl /var/tmp/JM/man-pages-ja-19991123
#

# get arg
#
if (@ARGV < 1) {die "$0 distroot\n"};

$DISTROOT = $ARGV[0];
unless (-d $DISTROOT) {die "$DISTROOT does not exist\n"};

unless($DISTROOT=~/^(.*)\/man-pages-ja-([0-9]+)$/){
        die "$DISTROOT don't have date field.\n";
}
$dir=$1;
$date=$2;

chdir($dir);

open(FL,"ls $DISTROOT/manual|");
while($tmp=<FL>){
	$tmp=~s/[\r\n]//g;
	$dist="man-pages-ja-$tmp-$date";
	system("rm -rf $dist");
	system("mkdir $dist");
	system("cp -pr $DISTROOT/manual/$tmp/* $dist");
	system("cp -pr $DISTROOT/README $dist");
	system("tar czf $dist.tar.gz $dist");
}
close(FL);
