#!/usr/bin/env perl
#------------------------------------------------------------
# translation_list の手動での更新を行うためのスクリプトです。
# 直接編集することなしに、ステータスを更新できます。
#
# 引き数なしで本コマンドを実行すると、ヘルプが表示されます。
#------------------------------------------------------------

use Getopt::Std;

my $DEBUG = "no";
my %new_status;
my $tlist_body = "";
my $update_timestamp = 1;
my $update_translator = 1;
my $backup = 0;
my $clear_entry = 0;
my $reset_old_translated_ver = 0;
my %opts;

BEGIN{
    $epath = `dirname $0`; chomp $epath;
    my $lpath = "$epath/../bin";
    unshift (@INC, $lpath);
}

use strict 'vars';
use JMtl ('line2hash', 'hash2line');

getopts("tTuUn:e:crbd", \%opts);
$update_timestamp = 1 if $opts{"t"};
$update_timestamp = 0 if $opts{"T"};
$update_translator = 1 if $opts{"u"};
$update_translator = 0 if $opts{"U"};
$backup = 1 if $opts{"b"};
$DEBUG = "yes" if $opts{"d"};

$clear_entry = 1 if $opts{"c"};
$reset_old_translated_ver = 1 if $opts{"r"};
$ARGV[2] = "_DUMMY_" if $clear_entry;

if ($#ARGV < 2) {
    print STDERR "Usage: JM-tl-modify.pl [OPTIONS] translation_list pagename new_status\n";
    print STDERR "    pagename = name.[1-9]\n";
    print STDERR "    new_status = TR DO DP PR RO RR UN\n";
    print STDERR "\n";
    print STDERR "Status:\n";
    print STDERR "  TR : Translation Reservation\n";
    print STDERR "  DO : Draft Only\n";
    print STDERR "  DP : Draft & Proof Reservation\n";
    print STDERR "  PR : Proof Reservation\n";
    print STDERR "  RO : Release Only\n";
    print STDERR "  RR : Release and update Reservation\n";
    print STDERR "  UN : UNassign\n";
    print STDERR "\n";
    print STDERR "OPTIONS:\n";
    print STDERR "    -t : Update timestamp (default)\n";
    print STDERR "    -T : DO NOT update timestamp\n";
    print STDERR "    -u : Update Translator info (default)\n";
    print STDERR "    -U : DO NOT update Translator info\n";
    print STDERR "    -n NAME : Update name field [JM_USER_NAME]\n";
    print STDERR "    -e MAIL : Update mail field [JM_USER_MAIL]\n";
    print STDERR "    -c : Clear entry of specified pagename\n";
    print STDERR "         (new_status is not required when -c is specified.)\n";
    print STDERR "    -r : Clear old translated version\n";
    print STDERR "    -b : Create backup of translation_list\n";
    print STDERR "    -d : Debug mode\n";
    exit 0;
}

my $user_name  = $opts{"n"} || $ENV{'JM_USER_NAME'};
my $user_mail = $opts{"e"} || $ENV{'JM_USER_MAIL'};
if ($update_translator && ($user_name eq "" || $user_mail eq "")) {
    print STDERR "Translator name or mail not specified.\n";
    exit 1;
}

my $tlist = $ARGV[0];
my $page = $ARGV[1];
my $command = $ARGV[2];

#printf "tlist = %s\n", $tlist;
#printf "page = %s\n", $page;
#printf "command = %s\n", $command;

# %new_status への代入
# 他のフィールドは使用しないので、初期化せず。
$new_status{'stat'} = $command;
$new_status{'page'} = $page;

my $ismatch = 'no';

open TLO, $tlist or die "cannot open $tlist\n";
while (<TLO>) {
    chomp;
    my %ti = line2hash($_);

    if ($ti{'kind'} eq 'link' &&
	"$ti{'lname'}.$ti{'lsec'}" eq $new_status{'page'})
    {
	if ($clear_entry) {
	    $ti{'stat'} = '1st_non';
	    my $tll = hash2line(%ti);
	    if ($DEBUG eq "yes") {print "$ismatch MATCH: $tll\n"};
	    $tlist_body .= "$tll\n";
	    next;
	}
	if ($new_status{'stat'} =~ /^R/) {
	    $ti{'stat'} = 'up2date';
	    my $tll = hash2line(%ti);
	    if ($DEBUG eq "yes") {print "$ismatch MATCH: $tll\n"};
	    $tlist_body .= "$tll\n";
	    next;
	}
    }
    unless ("$ti{'fname'}.$ti{'sec'}" eq $new_status{'page'}) {
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
      if ($new_status{'stat'} =~ /^UN/){$ti{'stat'} .= 'non'; last SW1;}
      if ($new_status{'stat'} =~ /^TR/){$ti{'stat'} .= 'rsv'; last SW1;}
      if ($new_status{'stat'} =~ /^DO/){$ti{'stat'} .= 'dft'; last SW1;}
      if ($new_status{'stat'} =~ /^DP/){$ti{'stat'} .= 'prf'; last SW1;}
      if ($new_status{'stat'} =~ /^PR/){$ti{'stat'} .= 'prf'; last SW1;}
      if ($new_status{'stat'} =~ /^RO/){$ti{'stat'} = 'up2date'; last SW1;}
      if ($new_status{'stat'} =~ /^RR/){$ti{'stat'} = 'up2datR'; last SW1;}
      if (not $clear_entry) {
	  die "Invalid new status. Valid status is one of TR DO DP PR RO RR.\n";
      }
  }

    if ($new_status{'stat'} =~ /^R/){
	$ti{'rver'} = $ti{'over'};
	$ti{'dver'} = $ti{'over'};
#	$ti{'newsec'} = $ti{'sec'};
    }
    if ($reset_old_translated_ver){
	$ti{'rver'} = $ti{'over'};
	$ti{'dver'} = $ti{'over'};
    }

#    $ti{'tdat'}  = $new_status{'date'};
#    $ti{'tmail'} = $new_status{'mail'};
#    $ti{'tname'} = $new_status{'name'};

    if ($update_timestamp) {
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
	$year += 1900; $mon += 1;
	$ti{'tdat'} = sprintf("%04d/%02d/%02d", $year, $mon, $mday);
    }
    if ($update_translator) {
	$ti{'tname'} = $user_name;
	$ti{'tmail'} = $user_mail;
    }
    # If translator name or email is not set, try to set it.
    if ($ti{'tname'} eq "" || $ti{'tmail'} eq "") {
	if ($user_name eq "" || $user_mail eq "") {
	    die "[$page] A translator is not specified for the page. " .
		"Please set name and mail of the translator.\n";
	    exit 2;
	} else {
	    print "[!!!] $page: Translator name and mail " .
		"are set automatically.\n";
	    $ti{'tname'} = $user_name;
	    $ti{'tmail'} = $user_mail;
	}
    }
    if ($clear_entry) {
	$ti{'stat'} = '1st_non';
	$ti{'tdat'} = '';
	$ti{'tname'} = '';
	$ti{'tmail'} = '';
	# Reset versions to the original ver.
	$ti{'rver'} = $ti{'over'};
	$ti{'dver'} = $ti{'over'};
    }

    my $tll = hash2line(%ti);

    if ($DEBUG eq "yes") {print "$ismatch MATCH: $tll\n"};
    $tlist_body .= "$tll\n";
}
close TLO;
if ($ismatch eq "no") {die "No match in $tlist\n"};

system "mv -f $tlist $tlist.orig" if $backup;
open TLN, "| nkf -w > $tlist" or die "cannot open $tlist.new\n";
print TLN $tlist_body;
close TLN;
print "UPDATE: $tlist ($page)\n";
