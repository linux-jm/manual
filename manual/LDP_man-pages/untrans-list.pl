#!/usr/bin/env perl

print <<EOF;
<HTML>
<HEAD>Translation status of LDP man-pages</HEAD>
<BODY>
<TABLE BORDER=1>
<TR><TH>page name</TH><TH>remaining</TH><TH>comp. %</TH></TR>
EOF

$poname = "";

while (<>) {
    if (/^po4a/) {
	@dat = split;
	$cfg = $dat[$#dat];
	@dat = split('/', $cfg);
	$poname = $dat[2];
	$poname =~ s/\.cfg$//;
	printf("<TR><TD ALIGN=\"center\" COLSPAN=3 BGCOLOR=\"Yellow\">" .
	       "<B>%s</B></TD></TR>\n", $poname);
    }
    next if ! /^Discard /;
    s/\(//;
    s/\)//;
    @dat = split(' ');
    $page = $dat[1];
    $comp = $dat[2];
    $all  = $dat[4];
    $ratio = $comp/$all*100;
    #printf("%s: %d/%d, %.2f\n", $page, $comp, $all, $comp/$all*100);
    printf("<TR><TD>%s</TD><TD>%d/%d</TD><TD>%.2f</TD>\n",
	   $page, ($all - $comp), $all, $ratio);
}

print <<EOF;
</TABLE>
</BODY></HTML>
EOF
