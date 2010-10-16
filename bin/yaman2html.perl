#!/usr/bin/perl

if (@ARGV < 1) { die "$0 roffpage\n";}
unless (-f $ARGV[0]) { die "cannot open $ARGV[0]\n";}

@path = split /\//, $ARGV[0];
$pagename = $path[$#path];
$pagename =~ s/\.[1-9]$//;

$header =~ s/%PAGENAME%/$pagename/eg;
print $header;

#
# assumes Debian's man-db package.
#
open MAN, "man -l -Tnippon $ARGV[0] |";

while(<MAN>){
    $_ =~ s/..\cH\cH//g;
    $_ =~ s/.\cH//g;
    print;
}
close MAN;

print $footer;
exit;

#
#
#
BEGIN{
   $header = <<'EOM';
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
  "http://www.w3.org/TR/REC-html40/loose.dtd">
<HTML LANG="ja" DIR="LTR">
<HEAD>
 <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-2022-JP">
 <TITLE>Manpage of %PAGENAME%</TITLE>
 <META NAME="author" LANG="en" CONTENT="JM Project Members">
 <META NAME="copyright" CONTENT="(C) 1999 JM Project.">
 <META NAME="DESCRIPTION" CONTENT="JM: JM Project.">
 <META NAME="keywords" CONTENT="JM, Linux, Japanese, Manual">
 <LINK REV="made" HREF="mailto:JM@linux.or.jp">
 <LINK REL="stylesheet" TYPE="text/css" HREF="../../../jm.css">
</HEAD>
<BODY>
 <H1>%PAGENAME%</H1>

 <BLOCKQUOTE>
  このページは man2html ではうまく整形されないため、
  roff を使って生成したテキストを貼り込んでいます。
 </BLOCKQUOTE>

 <A HREF="../../../index.html">JM Home Page</A>
 <PRE>
EOM

    $footer = <<'EOM';
 </PRE>
 <HR><ADDRESS>
  JM Project に関わるご意見ご要望は
  <A HREF="mailto:JM@linux.or.jp">JM@linux.or.jp</A>
  までお願いします。
 </ADDRESS><HR>
<P>
<IMG SRC="%URLROOT%/images/grey.png" WIDTH="14" HEIGHT="14" ALT="*">
<A HREF="%URLROOT%/">JM Project のメインページへ戻る</A>
</P>
</body>
</html>
EOM
}

	
