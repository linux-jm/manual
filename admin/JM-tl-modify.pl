#!/usr/bin/env perl
#------------------------------------------------------------
# translation_list の手動での更新を行うためのスクリプトです。
# 直接編集することなしに、ステータスを更新できます。
#
# 引き数なしで本コマンドを実行すると、ヘルプが表示されます。
#------------------------------------------------------------

use Getopt::Std;

my $DEBUG = 1;
my %status;
my $tlist_body = "";
my $update_timestamp = 0;
my $update_name = "";
my $update_email = "";
my %opts;

BEGIN{
    $epath = `dirname $0`; chomp $epath;
    my $lpath = "$epath/../bin";
    unshift (@INC, $lpath);
}

use strict 'vars';
use JMtl ('line2hash', 'hash2line');

getopts("tn:e:c", \%opts);
print "$#ARGV\n";
print $opts{"c"},"\n";

if ($#ARGV < 2) {
    print STDERR "Usage: JM-tl-modify.pl [OPTIONS] translation_list pagename new_status\n";
    print STDERR "    pagename = name.[1-9]\n";
    print STDERR "    new_status = TR DO DP PR RO RR\n";
    print STDERR "\n";
    print STDERR "OPTIONS:\n";
    print STDERR "    -t : Update timestamp\n";
    print STDERR "    -n NAME : Update name field\n";
    print STDERR "    -e MAIL : Update mail field\n";
    print STDERR "    -c : Clear entry of specified pagename\n";
    exit 0;
}

my $tlist = $ARGV[0];
my $page = $ARGV[1];
my $command = $ARGV[2];

#printf "tlist = %s\n", $tlist;
#printf "page = %s\n", $page;
#printf "command = %s\n", $command;

# %status への代入
# 他のフィールドは使用しないので、初期化せず。
$status{'stat'} = $command;
$status{'page'} = $page;

my $ismatch = 'no';

open TLO, $tlist or die "cannot open $tlist\n";
while (<TLO>) {
    chomp;
    my %ti = line2hash($_);

    if ($ti{'kind'} eq 'link' &&
	"$ti{'lname'}.$ti{'lsec'}" eq $status{'page'} &&
	$status{'stat'} =~ /^R/)
    {
	$ti{'stat'} = 'up2date';
	my $tll = hash2line(%ti);
	if ($DEBUG eq "yes") {print "$ismatch MATCH: $tll\n"};
	$tlist_body .= "$tll\n";
	next;
    }
    unless ("$ti{'fname'}.$ti{'sec'}" eq $status{'page'}) {
	$tlist_body .= "$_\n";
	if ($DEBUG eq "yes") {print "$ismatch : $_\n"};
	next;
    }

    $ismatch = 'on';

    if ($ti{'stat'} =~ /^1st/) {
	$ti{'stat'} = "1st_";
    } else {
	$ti{'stat'} = "upd_";
    }
  SW1: {
      if ($status{'stat'} =~ /^TR/){$ti{'stat'} .= 'rsv'; last SW1;}
      if ($status{'stat'} =~ /^DO/){$ti{'stat'} .= 'dft'; last SW1;}
      if ($status{'stat'} =~ /^DP/){$ti{'stat'} .= 'prf'; last SW1;}
      if ($status{'stat'} =~ /^PR/){$ti{'stat'} .= 'prf'; last SW1;}
      if ($status{'stat'} =~ /^RO/){$ti{'stat'} = 'up2date'; last SW1;}
      if ($status{'stat'} =~ /^RR/){$ti{'stat'} = 'up2datR'; last SW1;}
      die "error in STAT description\n" if not $opts{"c"};
  }

    if ($status{'stat'} =~ /^R/){
	$ti{'rver'} = $ti{'over'};
	$ti{'dver'} = $ti{'over'};
#	$ti{'newsec'} = $ti{'sec'};
    }

#    $ti{'tdat'}  = $status{'date'};
#    $ti{'tmail'} = $status{'mail'};
#    $ti{'tname'} = $status{'name'};

    if ($opts{"t"}) {
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
	$year += 1900; $mon += 1;
	$ti{'tdat'} = sprintf("%04d/%02d/%02d", $year, $mon, $mday);
    }
    $ti{'tname'} = $opts{"n"} if $opts{"n"};
    $ti{'tmail'} = $opts{"e"} if $opts{"e"};

    if ($opts{"c"}) {
	$ti{'tdat'} = '';
	$ti{'tname'} = '';
	$ti{'tmail'} = '';
    }

    my $tll = hash2line(%ti);

    if ($DEBUG eq "yes") {print "$ismatch MATCH: $tll\n"};
    $tlist_body .= "$tll\n";
}
close TLO;
if ($ismatch eq "no") {die "No match in $tlist\n"};

system "mv -f $tlist $tlist.orig";
open TLN, "| nkf -w > $tlist" or die "cannot open $tlist.new\n";
print TLN $tlist_body;
close TLN;
print "UPDATE: $tlist ($page)\n";
