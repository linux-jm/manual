#!/usr/bin/perl
#
# build html database file for man.cgi
#
# $Id: mkhtmldb.perl,v 1.2 2000/08/02 10:00:22 nakano Exp $
#
use GDBM_File;
use Fcntl;

# name of db file
$DBFILE='manhtmldb';

if (@ARGV < 2) {die "$0 pageroot urlroot\n"};

$PAGEROOT = $ARGV[0];
unless (-d $PAGEROOT) {die "$PAGEROOT does not exist\n"};

$URLROOT = $ARGV[1];

$HTMLROOT="$PAGEROOT/html";

open(RL,"cd $PAGEROOT/html; find . |");
while($tmp=<RL>){
    $tmp=~s/[\r\n]//g;
    unless($tmp=~/\/([^\/]+\/[^\/]+)\/([^\/]+)\.([1-9])\.html$/){
	next;
    }
    $dir=$1;
    $name=$2;
    $sec=$3;
    
    if ($dir =~ m/0MultiFileIdx/){next;}

    push @ { $urls{$name} }, "$URLROOT/$dir/$name.$sec.html";
}
close(RL);


tie %urlhash, 'GDBM_File', $DBFILE, &GDBM_WRCREAT, 0644
	|| die "cannot create $DBFILE";

	foreach $name (keys %urls){
		$urlhash{$name} = join ' ', @{ $urls{$name} };
	}

untie(%urlhash);

#chmod 0644, "$DBFILE";

