#!/usr/bin/perl
#
# translation_list をみて、実際にページがあるかのチェックをする.
#
BEGIN{
    $epath = `dirname $0`; chomp $epath;
    my $lpath = "$epath/../bin";
    unshift (@INC, $lpath);
}
use JMtl ('line2hash');

open TL, "cat `find $epath/../manual -name translation_list | sort` |";

while(<TL>){
	chomp;
	%ti = line2hash($_);

	if ($ti{'kind'} ne 'roff') {
		next;
	}

	if ($ti{'stat'} =~ m/^1st/) {
		next;
	}

	$pkg = $ti{'pkg'};
	$dir = $pkg; $dir =~ s/ /_/;
	$name = $ti{'fname'};
	$sec = $ti{'sec'};

	if ( $ti{'stat'} =~ m/^cnt/ ){
		$fpath = "$epath/../manual/$dir/contrib/man$sec/$name.$sec";
	} else {
		$fpath = "$epath/../manual/$dir/release/man$sec/$name.$sec";
	}

	unless ( -f $fpath ){
		print "release of $pkg: $name.$sec does not exist!\n";
		print "$fpath\n";
		print "$_\n";
	}
}

