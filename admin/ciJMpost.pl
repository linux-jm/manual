#!/usr/bin/perl -w
#
# $MSRC フォルダ (MH 形式) にあるメールを CVS に自動登録する。
#
use File::Basename;

$HOME="/home/jm";
$CVSDIR="$HOME/JM";
$ML2CVS="$CVSDIR/admin/ml2cvs";
$MHDIR="$HOME/Mail";

$MSRC="JMPOST";
$MTRASH="trash";

$REFILE="/usr/bin/mh/refile";

system("cd $CVSDIR && cvs update");

@mails = glob "$MHDIR/$MSRC/[1-9]*";
foreach $n (@mails) {
	open ADDOUT, "$ML2CVS $n |";
	while (<ADDOUT>){
		if ($_ !~ /^CREATE:/){next;}
		chomp;

		$path = (split)[1];

		$dir = dirname ($path);
		$base = basename ($path);

		chdir "$dir";
		$dir = `pwd`;
		chomp $dir;

		until (-d "./CVS" || $dir !~ /$CVSDIR/) {
			$dir =~ /(.*)\/([^\/]+)/;
			$dir = $1;
			push @subs, $2;
			chdir "$dir";
		}

		until (@subs == 0) {
			$sub = pop @subs;
			system("pwd; cvs add -ko $sub");
			$dir .= "/$sub";
			chdir "$dir";
		}

		system ("pwd; cvs add -ko $base");
		
	}
	close ADDOUT;
	system ("$REFILE `basename $n` -src +$MSRC +$MTRASH");
}

system("cd $CVSDIR && cvs ci -m 'cron commit'");

