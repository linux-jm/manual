#!/usr/bin/env perl

use File::Basename qw/basename/;

$print_format = 1;

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
    $page = basename($dat[1]);
    $comp = $dat[2];
    $all  = $dat[4];
    $remaining = $all - $comp;
    $ratio = $comp / $all * 100;

    if ($print_format) {
	print "# pagename,#complete,#remaining,#all\n";
	$print_format = 0;
    }
    print "$page,$comp,$remaining,$all\n";
}
