#! /usr/bin/perl -w

if (-r $ARGV[0]) {
  my @info = stat($ARGV[0]);
  my ($sec,$min,$hour,$day,$month,$year,$wday,$yday,$isdst) =
    localtime($info[9]);
  $month = $month + 1;
  $month = 1 if $month == 13;
  $month = "0" . $month if $month < 10;
  $day   = "0" . $day if $day < 10;
  $min   = "0" . $min if $min < 10;
  $sec   = "0" . $sec if $sec < 10;
  $year  += 1900;
  @dow = ("Sun", "Mon", "Tue", "Wed", "Thr", "Fri", "Sat");
  $dow = $dow[$wday];
  print "$year/$month/$day";
}
