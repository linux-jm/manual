#!/usr/bin/perl
#
# $Id: info-whole-archive.perl,v 1.3 2002/09/14 17:29:22 nakano Exp $
# index.m4 用のアーカイブ新着情報エントリを作る。
#
%month_table =
    (
     'Jan' => '01', 'Feb' => '02', 'Mar' => '03', 'Apr' => '04',
     'May' => '05', 'Jun' => '06', 'Jul' => '07', 'Aug' => '08',
     'Sep' => '09', 'Oct' => '10', 'Nov' => '11', 'Dec' => '12'
    );

$whole_archive = "man-pages-ja-[1-9]*.tar.gz";

open LS, "env LANG=C ls -lrt --full-time $whole_archive |";
while(<LS>) {
    chomp;

    @finfo = split / +/;

    $fkbytes = int ($finfo[4] / 1024);
    $fdate = "$finfo[9]/$month_table{$finfo[6]}/$finfo[7]";
    $fpath = $finfo[10];
    
    @fbrk = split /\//, $fpath;
    $fname = $fbrk[$#fbrk];

}
close LS;

if ($fname eq undef) {exit;}

print " <LI>新アーカイブファイル\n";
print "  $fname\n";
print "  及び対応する RPM アーカイブを\n";
print "  _LINK(download.html,ダウンロードのページ)\n";
print "  に登録しました。\n";
print "  <SMALL>($fdate)</SMALL></LI>\n";

#
#-rw-r--r--   1 jm       guest        2111 Sun Sep 12 06:53:20 1999 ChangeLog 

