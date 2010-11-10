#!/usr/bin/perl
#
# download.html 用のアーカイブリンクエントリを作る. (分割用)
#
$ENV{"LANG"}="C";

BEGIN{
    $epath = `dirname $0`; chomp $epath;
    unshift (@INC, $epath);
}
use linkInfo('get_latest_file', 'print_file_info');

sub print_unavail() {
    print "<P>\n Sorry, Archives are unavailable now\n</P>\n";
    exit 0;
}

#
#yes, it's an ugly hack...
#
$fpath = get_latest_file("per-pkg/man-pages-ja-LDP_man-pages-*.tar.gz");
print_unavail() if (not $fpath);
if ($fpath !~ m|per-pkg/man-pages-ja-LDP_man-pages-(\d+).tar.gz|) {
  print_unavail();
}
$date = $1;

@fpaths = glob("per-pkg/man-pages-ja-*-$date.tar.gz");
print "<UL>\n";
foreach $fpath (@fpaths){
    print "<LI>";
    print_file_info($fpath, "it");
    print "</LI>\n";
}
close LS;
print "</UL>\n";

