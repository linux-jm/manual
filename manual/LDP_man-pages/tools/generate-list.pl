#!/usr/bin/env perl

use File::Basename qw/basename/;

$debug = 0;
$page_count = 0;

sub print_header {
    print <<EOF;
<HTML>
<HEAD><TITLE>Translation status of LDP man-pages</TITLE>
<STYLE type="text/css">
<!--
 tr.over80 { background-color: #AAFFAA; }
 tr.over70 { background-color: #FFAAFF; }
-->
</STYLE>
</HEAD>
<BODY>
<TABLE BORDER=1>
<TR class=\"over80\"><TD COLSPAN=3>Released pages but not completed (released if &gt;=80%)</TD></TR>
<TR class=\"over70\"><TD COLSPAN=3>Near release pages (&gt;= 70%)</TD></TR>
<TR><TH>page name</TH><TH>remaining</TH><TH>comp. %</TH></TR>
EOF
}

sub print_footer {
    print <<EOF;
<TR><TD COLSPAN=3>Total $page_count pages</TD></TR>
</TABLE>
</BODY></HTML>
EOF
}

sub print_poname {
    my $poname = shift;
    printf("<TR><TD ALIGN=\"center\" COLSPAN=3 BGCOLOR=\"Yellow\">" .
	   "<B>%s</B></TD></TR>\n", $poname);
}

sub print_manpage {
    my ($page, $all, $remaining, $ratio) = @_;
    if ($ratio >= 80) {
        print '<TR class="over80">';
    } elsif ($ratio >= 70) {
        print '<TR class="over70">';
    } else {
	print '<TR>';
    }
    printf("<TD>%s</TD><TD>%d/%d</TD><TD>%.2f</TD>",
	   $page, $remaining, $all, $ratio);
    print "</TR>\n";
}

sub process_postat {
    my $postat = shift;
    my $poname = basename($postat);
    my $poname_print = 1;

    open(POSTAT, $postat);
    while (<POSTAT>) {
	next if /^#/;
	# format: pagename, #complete, #remaining, #total
	my ($page, $comp, $remaining, $total) = split(',');
	$ratio = $comp / $total * 100;
	if ($poname_print) {
	    print_poname($poname);
	    $poname_print = 0;
	}
	print_manpage($page, $total, $remaining, $ratio);
	$page_count++;
    }
}

print_header();
foreach my $name (@ARGV) {
    print STDERR "$name...\n" if $debug;
    process_postat($name);
}
print_footer();
