#!/usr/bin/perl
#
# download.html 用のアーカイブリンクエントリを作る. (info 用)
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
$fpath = get_latest_file("info-pkg/info-ja-GNU_coreutils-*.tar.gz");
print_unavail() if (not $fpath);
if ($fpath !~ m|info-pkg/info-ja-GNU_coreutils-(\d+).tar.gz|) {
  print_unavail();
}
#$date = $1;

@fpaths = glob("info-pkg/info-ja-*.tar.gz");

print "<UL>\n";
foreach $fpath (@fpaths){
    print "<LI>";
    print_file_info($fpath, "it");
    print "</LI>\n";
}
close LS;
print "</UL>\n";

