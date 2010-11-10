#!/usr/bin/perl
#
# リリースページのあるパッケージ名を出力
# bash のプロンプトから
#
#      % diff -u <(awk '/^[^#]/{print $1}' dist/script/pkgs.list | sort) \
#                <(admin/chkpkgs.perl|sort)
#
# とかするといいです。めんどくさいけど。
#
BEGIN{
    $epath = `dirname $0`; chomp $epath;
    my $lpath = "$epath/../bin";
    unshift (@INC, $lpath);
}
use JMtl ('line2hash');

open TLL, "find $epath/../manual -name translation_list |";

while(<TLL>){
	chomp;
	$tlf = $_;
	if (/\/([^\/]*)\/translation_list/){
		$pkg = $1;
	}

	open TL, $tlf;
	while (<TL>){
		chomp;
		%ti = line2hash($_);

		if ($ti{'stat'} !~ m/^1st/) {
			print "$pkg\n";
			last;
		}
	}
}

