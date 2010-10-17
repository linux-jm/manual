#!/usr/bin/perl
#
# $Id: mksolinks.perl,v 1.2 2000/08/02 10:00:22 nakano Exp $
#
# mksolinks.perl:
#   $MANROOT (想定しているのは checkout してきた JM CVS リポジトリ の
#   (JM/manual/) 以下にある */translation_list を見て、 */release/man?
#   以下に .so リンクのファイルを作るスクリプト.
#
$TRANSLIST = "translation_list";

# get arg
#
if (@ARGV < 1) {die "$0 manroot\n"};

$MANROOT = $ARGV[0];
unless (-d $MANROOT) {die "$MANROOT does not exist\n"};

open(RL,"cat `find $MANROOT -name $TRANSLIST` |");
while(<RL>){
	chop;
	unless (/^＠/) {next};

# ※:yp-tools:2.3:1998/05/??:ypchfn:1:yppasswd:1:
#
	@lf = split /:/;
	$pkg = $lf[1];
	$pkg =~ s/ /_/g;

	$lname = $lf[4];
	$lsec  = $lf[5];
	$pname = $lf[6];
	$psec  = $lf[7];

	if (-d "$MANROOT/$pkg/release/man$psec") {
		$MANDIR = "$MANROOT/$pkg/release";
	} elsif (-d "$MANROOT/$pkg/man$psec") {
		$MANDIR = "$MANROOT/$pkg";
	} else {
		print "Warning no man? directories are found at $pkg/\n";
	}

	$pfile = "$MANDIR/man$psec/$pname.$psec";
	unless (-f $pfile) {
		print "Warning: $pfile does not exist\n";
		next;
	}

	unless (-d "$MANDIR/man$lsec") {system "mkdir -p $MANDIR/man$lsec";}
	$lfile = "$MANDIR/man$lsec/$lname.$lsec";
	if (-f $lfile) {
		print "skip $lfile (already exists)\n";
		next;
	} else{
		system "echo .so man$psec/$pname.$psec > $lfile";
		print "make $lfile as an .so link\n"
	}
}

