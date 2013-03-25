#!/usr/bin/env perl

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
    printf("<TD>%s</TD><TD>%d/%d</TD><TD>%.2f</TD>\n",
	   $page, $remaining, $all, $ratio);
    print '</TR>';
}

$poname = "";
$poname_print = 1;

print_header();

while (<>) {
    if (/^po4a/) {
	@dat = split;
	$cfg = $dat[$#dat];
	@dat = split('/', $cfg);
	$poname = $dat[2];
	$poname =~ s/\.cfg$//;
	$poname_print = 1;
    }
    next if ! /^Discard /;
    s/\(//;
    s/\)//;
    @dat = split(' ');
    $page = $dat[1];
    $comp = $dat[2];
    $all  = $dat[4];
    $ratio = $comp/$all*100;
    if ($poname_print) {
	print_poname($poname);
	$poname_print = 0;
    }
    print_manpage($page, $all, $all - $comp, $ratio);
}

print_footer();
