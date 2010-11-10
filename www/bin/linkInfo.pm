#!/usr/bin/perl

package linkInfo;

use File::Basename;

require Exporter;
@ISA = qw(Exporter);
@EXPORT_OK = qw(get_latest_file get_file_info print_file_info);

sub get_latest_file {
    my $pattern = shift;

    my @files = glob $pattern;
    if ($#files < 0) {
       return ""; 
    } else {
       @files = sort { $b cmp $a } @files;
       return $files[0];
    }   
}

sub get_file_info {
    my $fpath = shift;

    my @STAT = stat $fpath;
    my $fkbytes = int($STAT[7]/1024);

    my @gt    = gmtime($STAT[9]);
    my $fdate = sprintf "%4d-%02d-%02d", $gt[5]+1900, $gt[4]+1, $gt[3]+1;

    return ($fkbytes, $fdate);
}

sub print_file_info {
    my $pattern = shift;
    my $msg = shift;

    $fpath = get_latest_file($pattern);
    if (not $fpath) {
        print "Sorry, $msg is unavailable now\n";
    } else {
        $fname = basename($fpath);
        ($fkbytes, $fdate) = get_file_info($fpath);
        print "<A HREF=\"$fpath\">$fname</A>\n";
        print "<SMALL>($fkbytes kbytes: $fdate)</SMALL>\n";
    }
}

1;
