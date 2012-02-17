#!/usr/bin/perl -w
#
# build html hierarchy using man2html 
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
# $MANROOT は CVS リポジトリの JM/manual,
# $WWWROOT は web の html コンテンツのトップ,
# $MAN2HTML は man2html コマンドを想定.
#
if (@ARGV < 3) {die "$0 srcroot destroot man2html\n"};

my $MANROOT = $ARGV[0];
unless (-d $MANROOT) {die "$MANROOT does not exist\n"};

my $WWWROOT = $ARGV[1];

my $MAN2HTML = $ARGV[2];
unless (-x $MAN2HTML) {die "$MAN2HTML does not executable\n"};

#
# for debugging purpose:
#
#my $MANROOT = "/home/nakano/text/JM/imp/manual";
#my $WWWROOT = "/home/nakano/public_html/JMwww/html";
#my $MAN2HTML = "/home/nakano/bin/man2html";

#
# man2html 出力に対して置換する各リンク (決め打ち(^^;)
#
my $MANWROOT='../../../manual';
my $MAIN='<A HREF="../../../index.html">JM Home Page</A>';
my $MAN2HTMLPAGE='<A HREF="../../man/man1/man2html.1.html">man2html</A>';
my $MLANG='<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-2022-JP">';
my $JMCSS='<LINK REL="stylesheet" TYPE="text/css" HREF="../../../jm.css">';
my $CONTCSS='<LINK REL="stylesheet" TYPE="text/css" HREF="../../../contrib.css">';
my $SELECT='0MultiFileIdx';

my (%roff_hash, %page_name, %link_hash, %cont_link);
#
# $MANROOT/$pkg/translation_list の scan.
#
print "scanning translation_list's...\n";
open RL,"find $MANROOT -name translation_list|";
while(<RL>){
    print;
    chomp;
    my $tl = $_;
    unless(m|.*manual/([^/]*)/translation_list|){next;}
    my $pkg=$1;

    open TL, $tl || die "cannot open $tl";
    while (<TL>){
	chomp;
	my %ti = line2hash($_);
	my $name = $ti{fname};
	my $sec = $ti{sec};
	my $page = "$pkg,$name,$sec";

	if ($ti{kind} eq "link" && $ti{stat} eq "up2date"){
	    my $dst = "../man$ti{lsec}/$ti{lname}.$ti{lsec}.html";
	    $link_hash{"$page"} = $dst;
	    push @{$page_name{"$name,$sec"}}, "$page";
	    print "collect link        : $page => $dst\n";
	    next;
	}

	if ($ti{kind} eq "roff" && $ti{stat} =~ /^up/) {
	    my $src = "$pkg/release/man$sec/$name.$sec";
	    $roff_hash{"$page"} = $src;
	    push @{$page_name{"$name,$sec"}}, "$page";
	    print "collect roff        : $page <= $src\n";
	    next;
	}

	if ($ti{kind} eq "roff" && $ti{stat} =~ /^cnt/) {
	    my $src = "$pkg/contrib/man$sec/$name.$sec";
	    $roff_hash{"$page"} = $src;
	    push @{$page_name{"$name,$sec"}}, "$page";
	    $cont_link{$page} = <<EOM;
<DIV ALIGN="right">
本ページは <A HREF="$ti{comment}">$ti{tname}</A>
($ti{tmail}) より寄贈いただきました。
</DIV>
EOM

	    print "collect contrib roff: <= $src\n";
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
# 重複ページ用の index.
#
print "creating index for pages with identical names...\n";
foreach my $fkey (sort keys %page_name){
    if ($#{ $page_name{$fkey} } > 0){
	my ($name,$sec) = split /,/, $fkey;

	my $cand = $#{$page_name{$fkey}} + 1;
	print "$name.$sec has $cand candidates...";

	system("mkdir -p $WWWROOT/$SELECT/man$sec");
	open WL, "| nkf -j > $WWWROOT/$SELECT/man$sec/$name.$sec.html";

	my $header = $idx_header;
	$header =~ s/_PAGENAME_/$name/ge;
	print WL $header;

	foreach my $i (0 .. $#{ $page_name{$fkey}}){
	    my ($mpkg, $mname, $msec);
	    ($mpkg,$mname,$msec)=split /,/, $page_name{$fkey}[$i];
	    my $anchor = "$mname.$msec in $mpkg";
	    my $link   = "../../$mpkg/man$msec/$mname.$msec.html";
	    print WL "<LI><A HREF=\"$link\">$anchor</A></LI>\n";
	}
	print WL $idx_footer;
	close WL;
	print "index created.\n";
    }
}

#
# roff -> html
#
foreach my $fkey (sort keys %roff_hash){
    my ($pkg, $name, $sec);
    ($pkg,$name,$sec)=split /,/, $fkey;

    my $hdir = "$WWWROOT/$pkg/man$sec";
    my $hfile = "$hdir/$name.$sec.html";

    system("mkdir -p $hdir");

    print "converting $pkg/$name.$sec...";
    my $roffpage = "$MANROOT/$roff_hash{$fkey}";

    # roff page への link.
    my $ROFF = "<A HREF=\"$MANWROOT/$roff_hash{$fkey}\">roff page</A>";
    my $NAVI = "$MAIN\n$ROFF";

    my $START = "$MLANG\n";
    if ($roffpage =~ m|/contrib/|){
	$START .= "$CONTCSS\n</HEAD>\n<BODY>\n$cont_link{$fkey}\n";
    } else {
	$START .= "$JMCSS\n</HEAD>\n<BODY>\n";
    }

    open M2H, "grep -v '^\.PD' $roffpage | $MAN2HTML |";
    open WL,"| nkf -j > $hfile";

    while(<M2H>){
	if($. < 2){next;};	

#	s/(\&\#([0-9]+)\;)/pack("C",$1)/ge;
	s///g;

	s|</HEAD><BODY>|$START|ge;
	s|<A HREF=\"(http://localhost)?/cgi-bin/man/man2html\">Return to Main Contents</A>|$NAVI|ge;
	s|<A HREF=\"(http://localhost)?/cgi-bin/man/man2html\">man2html</A>|$MAN2HTMLPAGE|ge;

	# 別ページへのリンクアンカーの処理.
	#
	while (m|<A HREF=\"(http://localhost)?/cgi-bin/man/man2html\?([1-9])[a-zA-Z]?\+([^\"]+)|){
	    my $lpage = "$3,$2";
            s|http://localhost/cgi-bin/|/cgi-bin/|;

	    if ($#{$page_name{$lpage}} == -1){
		s|<A HREF=\"/cgi-bin/man/man2html[^>]+>([^<]+)</A>|$1|;

	    } elsif ($#{$page_name{$lpage}} == 0){
                my $repl;
		my ($lpkg,$lname,$lsec) = split /,/, ${$page_name{$lpage}}[0];

	        if ($pkg eq $lpkg) {
		    $repl = "../man$lsec/$lname.$lsec.html";
		} else {
		    $repl = "../../$lpkg/man$lsec/$lname.$lsec.html";
		}
	        s|/cgi-bin/[^\"]+|$repl|;

	    } else {
                my $repl;
		my ($lpkg,$lname,$lsec) = split /,/, ${$page_name{$lpage}}[0];
	        $repl = "../../$SELECT/man$lsec/$lname.$lsec.html";

	        foreach my $j (0 .. $#{$page_name{$lpage}}){
		    my ($lpkg,$lname,$lsec) = split /,/, ${$page_name{$lpage}}[$j];
	            if ($lpkg eq $pkg) {
			$repl = "../man$lsec/$lname.$lsec.html";
		    }
                }
                s|/cgi-bin/[^\"]+|$repl|;
            }
	} #end of while(m/../).
        print WL;
    }
    close M2H;
    close WL;
    print "done.\n";
}

#
# make symlinks
#
foreach my $fkey (sort keys %link_hash){
    my ($pkg, $name, $sec) = split /,/, $fkey;

    my $hdir = "$WWWROOT/$pkg/man$sec";
    my $hfile = "$hdir/$name.$sec.html";
    my $dst = $link_hash{$fkey};

    unless (-f "$hdir/$dst"){;
	print "WARN: dest $hdir for symlink $pkg/$name.$sec lacks.\n";
	next;
    }

    system("cd $hdir; ln -s $dst $name.$sec.html");

    print "$pkg/man$sec/$name.$sec.html: create symlink to $dst\n";
     next;
}

#
# インデックスページのヘッダ・フッタ
#
BEGIN{
   $idx_header = <<'EOM';
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
  "http://www.w3.org/TR/REC-html40/loose.dtd">
<HTML LANG="ja" DIR="LTR">
<HEAD>
 <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-2022-JP">
 <TITLE>_PAGENAME_</TITLE>
 <META NAME="author" LANG="en" CONTENT="JM Project Members">
 <META NAME="copyright" CONTENT="(C) 1999 JM Project.">
 <META NAME="DESCRIPTION" CONTENT="JM: JM Project.">
 <META NAME="keywords" CONTENT="JM, Linux, Japanese, Manual">
 <LINK REV="made" HREF="mailto:linuxjm-discuss@lists.sourceforge.jp">
 <LINK REL="stylesheet" TYPE="text/css" HREF="../../../jm.css">
</HEAD>
<BODY>
 <H1>_PAGENAME_</H1>
 <P>同名のページが複数あります。以下の候補から選んでください</P>
 <UL>
EOM

    $idx_footer = <<'EOM';
 </UL>
 <P>
 <IMG SRC="../../../images/grey.png" WIDTH="14" HEIGHT="14" ALT="*">
 <A HREF="../../../index.html">JM Project のメインページへ戻る</A>
 </P>
</BODY>
</HTML>
EOM
}

