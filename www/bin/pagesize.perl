#!/usr/bin/perl

unless ( -f $ARGV[0] ){
	print "$ARGV[0] <SMALL>(unavailable now)</SMALL>\n";
	exit 1;
}

@STAT = stat $ARGV[0];
$fkbytes = int($STAT[7]/1024);

print "<SMALL>($fkbytes kbytes)</SMALL>\n";

