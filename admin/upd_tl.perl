#!/usr/bin/perl
#
# update_list を見て translation_list を更新する。
#
# 第 1 引数に translation_list, 第 2 引数に update_list,
# 第 3 引数にパッケージの新しいバージョンを指定する。
#
# 出力ファイルのファイル名は "第1引数.第3引数" となる。
#
# update_list の書式は以下の通り
#
# ・フィールドの区切り文字は ":" または " "。
#
# ・第 1 フィールドは U(更新) A(追加)  L(リンク) のいずれか。
#   # で始まる行はコメント行とみなされる。
#
# ・第 2, 3 フィールドは basename と セクション番号。
#
# ・U, A の場合, 第 4 フィールドはオリジナルの日付。
#   (U の場合は省略可能。その場合は現在の日付が使われる。)
#
# ・L の場合、第 4, 5 フィールドはリンク先ページの basename と
#   セクション番号。
#
# update_list の例:
#
#	#updated
#	U strtok:3 2000/02/13
#	U toupper:3
#	#NEWLY ADD
#	A pivot_root:2 2000/02/03
#	A daemon:3 1993/06/09
#	L dlclose:3 dlopen:3
#	L dlerror:3 dlopen:3
#	A dlopen:3 1995/05/16
#	L dlsym:3 dlopen:3
#
# バグ・制限
#      セクションの変更したページには対応してません。
#      ページの削除には対応してません。
#
BEGIN{
    $epath = `dirname $0`; chomp $epath;
    my $lpath = "$epath/../bin";
    unshift (@INC, $lpath);
}
use JMtl('hash2line', 'line2hash');

my (%ti, %tl, $package, $newver);

if (@ARGV < 2) { die "$0 translation_list update_list new_version\n";}
$translation_list = $ARGV[0];
$update_list = $ARGV[1];
$newver = $ARGV[2];

#
# import old tranalation_list
#
open TL, $translation_list || die "cannot open $translation_list\n";
while(<TL>){
    chomp;
    %ti = line2hash($_);
    my $pname = "$ti{sec}:$ti{fname}";
    %{$tl{$pname}} = %ti;
}
close TL;
$package = $ti{pkg};

#
# parse update_list
#
open UL, $update_list || die "cannot open $update_list\n";
while (<UL>){
    chomp;
    if (/^\#/) {next};

    my @ull = split(/[ :]/);

    if (@ull < 3) {die "entry must contain at lease 3 fields\n"};
    my $pname = "$ull[2]:$ull[1]";

    if ($ull[0] eq "U") {
	if (@ull > 3) { $Udate{$pname} = $ull[3] }
        else{ $Udate{$pname} = "no-change"; }
	next;
    }

    if ($ull[0] eq "A") {
	if (@ull < 4){die "date entry is ommitted for A entry\n"}
	$Adate{$pname} = $ull[3];
	next;
    }

    if ($ull[0] eq "L") {
	if (@ull < 5){die "lname and/or lsec entry is ommitted for L entry\n"}
	$Lfile{$pname} = "$ull[4]:$ull[3]";
	next;
    }

    if ($ull[0] eq "R") {
	$Rfile{$pname} = "yes";
	next;
    }
}

#
# update and remove roff pages
#
foreach my $n (sort keys %tl){
    if ($Udate{$n} ne undef){
	# link ページが roff に変更された場合は
	# 新規追加ページと同様に扱う。
	if (${$tl{$n}}{kind} ne "roff") {
	    delete $tl{$n};
	    $Adate{$n} = $Udate{$n};
	    next;
	}

	${$tl{$n}}{over} = $newver;

        if (${$tl{$n}}{stat} !~ /(dft|prf)/){
	    ${$tl{$n}}{dver} = ${$tl{$n}}{rver};
	}

        if ($Udate{$n} ne "no-change"){${$tl{$n}}{odat} = $Udate{$n}};

        if (${$tl{$n}}{stat} eq "up2date"){${$tl{$n}}{stat} = "upd_non";}
        elsif (${$tl{$n}}{stat} eq "up2datR"){${$tl{$n}}{stat} = "upd_rsv";}
	elsif (${$tl{$n}}{stat} eq "cnt_upd"){${$tl{$n}}{stat} = "cnt_old";}
        next;
    }	

    if ($Rfile{$n} ne undef){
	open NOL, ">> obsoleted_list.$newver";
	${$tl{$n}}{comment} = "dissap. at $newver";
	my $ol = hash2line(%{$tl{$n}});
	print NOL "$ol\n";
	close NOL;
	delete $tl{$n};
        next;
    }

    if (${$tl{$n}}{rver} eq ${$tl{$n}}{over} ||
        ${$tl{$n}}{rver} eq undef) {${$tl{$n}}{rver} = $newver;}

    if (${$tl{$n}}{dver} eq ${$tl{$n}}{over} ||
        ${$tl{$n}}{dver} eq undef) {${$tl{$n}}{dver} = $newver;}

    ${$tl{$n}}{over} = $newver;
}

#
# add roffs from update_list
#
foreach my $n (keys %Adate) {
    (my $psec, my $pname) = split(/:/, $n);
    ${$tl{$n}}{stat} = "1st_non";
    ${$tl{$n}}{kind} = "roff";
    ${$tl{$n}}{pkg}  = $package;
    ${$tl{$n}}{over} = $newver;
    ${$tl{$n}}{odat} = $Adate{$n};
    ${$tl{$n}}{fname} = $pname;
    ${$tl{$n}}{sec} = $psec;
}

#
# add links from update_list
#
foreach my $n (keys %Lfile) {
    my $lpage = $Lfile{$n};
    (my $psec, my $pname) = split(/:/, $n);
    (my $lsec, my $lname) = split(/:/, $lpage);

    ${$tl{$n}}{kind} = "link";
    if(${$tl{$lpage}}{odat} eq undef) {die "no link file $lname for $n\n";}

    ${$tl{$n}}{pkg}  = $package;
    ${$tl{$n}}{fname} = $pname;
    ${$tl{$n}}{sec} = $psec;
    ${$tl{$n}}{lname} = $lname;
    ${$tl{$n}}{lsec} = $lsec;
}

#
# refresh links
#
foreach my $n (keys %tl){
    if (${$tl{$n}}{kind} ne "link") {next;}

    if (${$tl{$n}}{lname} eq undef){
	open NOL, ">> obsoleted_list.$newver";
	${$tl{$n}}{comment} = "dissap. at $newver";
	my $ol = hash2line(%{$tl{$n}});
	print NOL "$ol\n";
	close NOL;
	delete $tl{$n};
        next;
    }

    my $lpage = "${$tl{$n}}{lsec}:${$tl{$n}}{lname}";

    if(${$tl{$lpage}}{stat} =~ /^up/){
	${$tl{$n}}{stat} = "up2date";
    } else {
	${$tl{$n}}{stat} = "1st_non";
    }
    ${$tl{$n}}{odat} = ${$tl{$lpage}}{odat};
    ${$tl{$n}}{over} = ${$tl{$lpage}}{over};
    ${$tl{$n}}{dver} = ${$tl{$lpage}}{dver};
    ${$tl{$n}}{rver} = ${$tl{$lpage}}{rver};

}

open NTL, "> $translation_list.$newver";
foreach $n (sort keys %tl){
    if (${$tl{$n}}{stat} eq undef){next;}

    my $ol = hash2line(%{$tl{$n}});
    print NTL "$ol\n";
}
close NTL;

