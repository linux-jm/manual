#!/usr/bin/perl
#
# download.html 用のアーカイブリンクエントリを作る. (全体用)
#
$ENV{"LANG"}="C";

BEGIN{
    $epath = `dirname $0`; chomp $epath;
    unshift (@INC, $epath);
}
use linkInfo('print_file_info');

print_file_info("man-pages-ja-*.tar.gz");
