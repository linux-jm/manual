#!/usr/bin/perl
#
# index.m4 用のアーカイブ新着情報エントリを作る。
#
$ENV{"LANG"}="C";

BEGIN{
    $epath = `dirname $0`; chomp $epath;
    unshift (@INC, $epath);
}
use linkInfo qw(get_latest_file get_file_info);
use File::Basename;

$whole_archive = "man-pages-ja-[1-9]*.tar.gz";
$fpath = get_latest_file($whole_archive);
exit if (not $fpath);

$fname = basename($fpath);
($fkbytes, $fdate) = get_file_info($fpath);

print " <LI>新アーカイブファイル\n";
print "  $fname\n";
print "  及び対応する RPM アーカイブを\n";
print "  _LINK(download.html,ダウンロードのページ)\n";
print "  に登録しました。\n";
print "  <SMALL>($fdate)</SMALL></LI>\n";
