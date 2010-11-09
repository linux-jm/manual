#!/usr/bin/perl
use Env qw (PATH LANG);
use strict 'vars';
use Encode qw (decode);
use utf8;

#
# %pw は global 変数.
#
my ($MANROOT, $PACK, $OWNER, $GROUP,
    @released, %ppage, @pl, $ans);

my $PKGLIST = "script/pkgs.list";
my @pack_method = ("none", "gzip", "bzip2", "compress");
my $podsec = "1";

#
# インストール情報
#
print "[INSTALLATION INFORMATION]\n";
print "(just Return if you accept default)\n";

do{
    $MANROOT = "/usr/share/man/$LANG";
    print "   Install directory   [$MANROOT] ?: ";
    $ans = <STDIN>; chomp $ans;
    if ($ans ne "") {$MANROOT = $ans;}

    print "   compress manual with..\n";
    for my $i (0 .. $#pack_method){
	print "      $i: $pack_method[$i]\n";
    }
    print "   select [0..$#pack_method] : ";
    $ans = <STDIN>; chomp $ans;
    if  ($ans eq "") {$ans = 0;}
    if ($ans < 0 || $ans > $#pack_method) {$PACK = $pack_method[0]}
    else {$PACK = $pack_method[$ans]}

    $OWNER = "root";
    print "   uname of page owner [$OWNER] ?: ";
    $ans = <STDIN>; chomp $ans;
    if ($ans ne "") {$OWNER = $ans;}

    $GROUP = "root";
    print "   group of page owner [$GROUP] ?: ";
    $ans = <STDIN>; chomp $ans;
    if ($ans ne "") {$GROUP = $ans;}

    print "\n";
    print "   Directory:    $MANROOT\n";
    print "   Compression:  $PACK\n";
    print "   Page uid/gid: $OWNER/$GROUP\n";
    print "\n";
    do {
	print "All OK? (Yes, [C]ontinue / No, [R]eselect) : ";
	$ans = <STDIN>; chomp $ans;
    } until ($ans =~ /^[yYnNcCrR]/);

} until ($ans =~ /^[yYcC]/);

#
# パッケージデータの読み込み (ファイルの先にあるほうが
# 後の conflict 解消の時に前の候補になる)。
#
my $i = 0;
open PL, $PKGLIST || die "cannot open $PKGLIST";
while(<PL>) {
    $_ = decode('utf-8', $_);
    chomp;
    if (m/^\#/){next;}

    my @l = split /[ \t]+/;
    push @pl, $l[0];
    if ($l[1] =~ /Y.*/){
        $main::pw{$l[0]} = $i;
    } else {
        $main::pw{$l[0]} = -1;
    }
    ++$i;
}
close(PL);

#
# インストールするパッケージの選択
# インストールしない奴は優先度 $pw{$name} を -1 にする。
#
print "\n\n";
print "[INSTALL PACKAGE SELECTION]\n";
print "(just Return if you accept default choice)\n";
print "(you can change the default by editing script/pkgs.list)\n";

do{
    for $i (0 .. $#pl){
	my $qstr = ($main::pw{$pl[$i]} > -1) ? "[Y/n]" : "[y/N]";
	printf "   [%2d/%2d] %-15s %s ?: ", $i, $#pl, $pl[$i], $qstr;
	$ans = <STDIN>; chomp $ans;
	if ($ans =~ /[Yy].*/) { $main::pw{$pl[$i]} = $i;}
	if ($ans =~ /[Nn].*/) { $main::pw{$pl[$i]} = -1;}
    }

    do {
	print "All OK? (Yes, [C]ontinue / No, [R]eselect) : ";
	$ans = <STDIN>; chomp $ans;
    } until ($ans =~ /[yYnNcCrR].*/);

} until ($ans =~ /^[yYcC]/);

#
# translation_list からインストールすべきファイルを取得.
#
open TL, "cat `find manual/ -name translation_list -print` |";
while(<TL>) {
    $_ = decode('utf-8', $_);
    if (/^×/ || /^▲/ || /^△/ || /^●/ || /^※/ || /^$/) { next; }
    chomp;
    my @l = split /:/;
    $l[1] =~ s/ /_/e;
    if ($main::pw{$l[1]} == -1) {next;}
    (my $sec, my $osec) =  split /=>/, $l[5];
    if ($sec eq "pod"){$sec = $podsec;}
    push @released, join(":", $l[1], $l[4], $sec);
}
close(TL);

#
# 優先度順ソート.
#
@released = sort by_sec_name @released;
for $i (0 .. $#released){
    my @l = split /:/, $released[$i];
    push @{ $ppage{"$l[1]:$l[2]"} }, $l[0];
}

#
# conflict の数 $nc を勘定.
#
my $nc = 0;
foreach my $key (keys %ppage) {
    if (@{$ppage{$key}} < 2) {next;}
    $nc++;
}

#
# conflict しているファイルからインストールするものを選ぶ.
#
print "\n\n";
print "[RESOLVE CONFLICTS]\n";
print "(just Return if you accept item 0)\n";

do{
    my $i = 0;
    foreach my $key (sort keys %ppage) {
	if (@{$ppage{$key}} < 2) { next; }
	my $page = $key;
	$page =~ s/:/./;

	# $cf は最終要素の index.
	#
	my $cf = $#{$ppage{$key}};
	my $nf = $cf + 1;

	print "   [$i/$nc] There are $nf pages for $page:\n";
	for my $j (0 .. $cf){
	    print "    $j: in ${$ppage{$key}}[$j]\n";
	}
	print "   Which to install? (0..$cf) : ";

	$ans = <STDIN>; chomp $ans;
	if ($ans eq "") {$ans = 0};
	if ($ans < 0 || $ans > $cf) { $ans = 0 };

	#swap	
	my $tmp = ${$ppage{$key}}[0];
	${$ppage{$key}}[0] = ${$ppage{$key}}[$ans];
	${$ppage{$key}}[$ans] = $tmp;

	print "   ${$ppage{$key}}[0]/$key is selected.\n\n";
	$i++;
    }

    do {
	print "All OK? (Yes, [C]ontinue / No, [R]eselect) : ";
	$ans = <STDIN>; chomp $ans;
    } until ($ans =~ /^[yYnNcCrR]/);

} until ($ans =~ /^[yYcC]/);

#
# インストールスクリプトを作る。
# インストール先は $MANROOT, 圧縮は $pack.
#
print "\n\ncreating installation script...";
open (ISS, ">installman.sh") || die "cannot create installman.sh\n";

print ISS "#!/bin/sh\n";

print ISS "mkdir -p $MANROOT;";
print ISS "chown $OWNER.$GROUP $MANROOT\n";
for $i (1..9){
    print ISS "mkdir -p $MANROOT/man$i;";
    print ISS "chown $OWNER.$GROUP $MANROOT/man$i\n";
}
print ISS "\n";

foreach my $key (sort keys %ppage) {
    (my $name, my $sec) = split /:/, $key;
    my $pkg = ${$ppage{$key}}[0];
    my $mansrc = "manual/$pkg/man$sec/$name.$sec";
    my $mandst = "$MANROOT/man$sec";

    print ISS "echo -n install $pkg: $name.$sec .. \n";
    print ISS "install -o $OWNER -g $GROUP -m 644 $mansrc $mandst\n";

    if ($PACK ne "none"){
	print ISS "echo -n $PACK .. \n";
	print ISS "$PACK -f $mandst/$name.$sec\n";
    }

    print ISS "echo done.\n\n";
}
close(ISS);

print "done\n";
print "now you can \"make install\" as user $OWNER.\n";


#######################################
# sort by pkg, senction and name
#
sub by_sec_name {
    my @af = split /:/, $a;
    my @bf = split /:/, $b;

    ($main::pw{$af[0]} <=> $main::pw{$bf[0]}) ||
	($af[2] <=> $bf[2]) || ($af[1] cmp $bf[1]);
}

