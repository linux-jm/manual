#!/usr/bin/perl
#
# translation_list をさわる perl script のひな形。
#
# とりあえずこれは標準入力から translation_list を
# 読み込んで、 man-pages-0.4 のリリース (1998/12/24)
# より日付が後で、かつステータスが ◎, ○, ☆ の
# ページを表示します。
#
BEGIN{
    $epath = `dirname $0`; chomp $epath;
    my $lpath = "$epath/../bin";
    unshift (@INC, $lpath);
}
use JMtl ('line2hash');

use Time::Local;

$yr4 = 1998;
$mo4 = 12 - 1; # timelocal は 0..11 のため
$md4 = 24;

$ptime = timelocal(0, 0, 0, $md4, $mo4, $yr4);

open TL, "cat `find $epath/../manual -name translation_list | sort` |";

while(<TL>){
	chop;
	%ti = line2hash($_);

	if ($ti{'kind'} ne 'roff') {
		next;
	}

	if ($ti{'stat'} !~ m/^up2/ && $ti{'stat'} !~ m/^upd_non/) {
		next;
	}

	($yr, $mo, $md) = split "/", $ti{'tdat'};
	$mo--;
	$rtime = timelocal(0, 0, 0, $md, $mo, $yr);

	if ($rtime > $ptime) {
		print "$ti{'tdat'}:$ti{'pkg'}:$ti{'fname'}.$ti{'sec'}\n";
	}
}

