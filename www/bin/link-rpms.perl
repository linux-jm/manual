#!/usr/bin/perl
#
# download.html 用のアーカイブリンクエントリを作る. (rpm 用)
#
$ENV{"LANG"}="C";

BEGIN{
    $epath = `dirname $0`; chomp $epath;
    unshift (@INC, $epath);
}
use linkInfo('get_latest_file', 'print_file_info');

$RPMBASE = "$ARGV[1]rpm/jman_pages-0.5-*";

print "<UL>\n";

# noarch.rpm
print "<LI>";
print_file_info("$RPMBASE.noarch.rpm", "RPM");
print "</LI>\n";

# srpm
print "<LI>";
print_file_info("$RPMBASE.src.rpm", "SRPM");
print "</LI>\n";

print "</UL>\n";
