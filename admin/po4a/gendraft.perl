#!/usr/bin/perl
#
# Copyright (c) 2021 Linux JM project
#         all rights reserved.
#
# Written by Michio MATSUYAMA <michio_matsuyama@yahoo.co.jp>
#
# 内容説明
#   引数に与えられたオリジナル英文 man ページファイル(第1引数)
#   と翻訳済日本語 man ページファイル(第2引数) に基づいて、
#   draft ファイル文面を生成し、draft ファイル(第3引数)に出力
#   します。
#
# 利用制約
#   第1引数、第2引数の roff 構造が完全に一致していないと、
#   本スクリプトは動作しません。これは主に po4a を使って
#   翻訳処理を行った直後に(翻訳途上,翻訳完成には関係なく)
#   後追いで draft ファイルを生成することを意図しています。
#
# 利用方法
#   perl gendraft.perl origmanfile jamanfile draftfile
#
#     origmanfile: オリジナル英文 man ページファイルパス。
#     jamanfile:   翻訳済日本語 man ページファイルパス。
#     draftfile:   出力する draft ファイルパス。
#
#   実行例
#     perl gendraft.perl orignal/man.1 ja/man.1 draft/man.1
#

use strict;
use File::Basename;
use File::Path;

if (@ARGV < 3) {
  print STDERR "perl $0 <orig> <ja> <outfile>\n";
  exit 1;
}

# コマンドライン引数を取得
my $origmanfile = shift;
my $jamanfile   = shift;
my $draftfile   = shift;

# origmanfile, jamanfile を読み込み専用で開く
open (my $fhorig, '<', $origmanfile) or die "Error: file not found: ".$origmanfile;
open (my $fhja,   '<', $jamanfile)   or die "Error: file not found: ".$jamanfile;

# do_proc_for 呼び出しを行って @origmanarray、@jamanarray をそれぞれ取得
my @origmanarray = &do_proc_for($fhorig, 0);
my @jamanarray   = &do_proc_for($fhja,   1);

close($fhja);
close($fhorig);

# @origmanarray、@jamanarray 要素数が違う場合は終了。
# 当該 draft ファイルの生成は諦めるが警告するだけにとどめる。
# (Makefile からの順次呼び出しをすべて成功させるため。)
my $len_orig_elements = @origmanarray;
my $len_ja_elements   = @jamanarray;
if ($len_orig_elements != $len_ja_elements) {
  print STDERR "Warning: number of elements in both orig and ja file should be equal.\n";
  print STDERR "Skipped to create draft file: $draftfile\n";
  exit 0;
}

#for (my $cnt = 0; $cnt < $len_orig_elements; $cnt++){
#  my @each_orig = @{$origmanarray[$cnt]};
#  my @each_ja   = @{$jamanarray[$cnt]};
#  print "org(".$cnt."): ".@each_orig[0]."\n";
#  print "  ".@each_orig[1];
#  print "ja(".$cnt."): ".@each_ja[0]."\n";
#  print "  ".@each_ja[1];
#}

# 出力 draftfile を開く
open (my $fhdraft, '>', $draftfile) or die "Error: file not created: ".$draftfile;

&output_proc;

close($draftfile);

#
# do_proc_for
#   第１引数に指定される man ページファイルのファイルハンドルから
#   全行を読み込みながら、以下のような配列を生成します。
#    ((MACRO1, PARAGRAPH1), (MACRO2, PARAGRAPH2), ...)
#   ここで MACROn は主要な roff マクロ [TH|SH|SS|TP|LP|PP|P|IP|HP|RS|RE]
#   のいずれかであり、その man ページ内に見つかったものを順に表します。
#   またPARAGRAPHn は１つの(改行文字も含む)文字列であり、その構成は
#   MACROn の行から次に見つかった MACRO(n+1) の（あるいはファイル終端の）
#   直前の行までを連結したものです。最後にその配列を戻り値として返します。
#
sub do_proc_for {

  my $macro_name = "";
  my $macro_found = 0;
  my $paragraph = "";

  my $fh = $_[0];
  my $extra = $_[1];
  my @array = ();
  my @subarray;

  # 第1引数に与えられたファイルハンドルの各行を順にループ
  foreach my $currentline (<$fh>) {

    # $currentline が ".\" で始まる行は無視
    if ($currentline =~ /^\.\\\"/) {
      next;
    }

    # $curretline が主要 roff マクロで始まるかどうか
    if ($currentline =~ /^\.(TH|SH|SS|TP|LP|PP|P|IP|HP|RS|RE)/ || 
        $currentline =~ /^(\s*)$/) {

      # '\fR' + '空行' となる特殊ケースを処理
      # これを行わないと、最終的な生成配列の数が不一致となるため。
      # $extra = 1 を受け取ることにより、jaman のみを処理する。
      if ($currentline =~ /^(\s*)$/ && $extra == 1) {
        my $laststr = substr($paragraph, -4, 3);
        if ($laststr eq "\\fR") {
          # 前処理の最後が "\\fR" で終わっていて、次に空行がきた場合
          # 空行を区切り扱いとせずにループ続行
          $paragraph = $paragraph.$currentline;
          next;
        }
      }

      if ($macro_name ne "") {
        # 部分配列 (MACROn, PARAGRAPHn) を出力配列 @array に追加
        @subarray = ($macro_name, $paragraph);
        push(@array, [@subarray]);
      }

      # 次のループに向けて $macro_name と $paragraph を初期セット
      $macro_name = $1;
      $paragraph  = $currentline;

    } else {
      # 主要 roff マクロで始まらない行は順次連結
      $paragraph = $paragraph.$currentline;

    }
  }
  # 最後に残った部分配列 (MACROn, PARAGRAPHn) を出力配列 @array に追加
  @subarray = ($macro_name, $paragraph);
  push(@array, [@subarray]);

  # 出力配列を返す
  return @array;
}

# output_proc
#   上の do_proc_for を適用した @origmanarray、@jamanarray が生成済
#   であることを前提として、またその２つの MACROn の内容およびその順は
#   まったく一致しているとの前提で、両配列を同時にループして（ループ
#   カウントは @origmanarray に基づいて）、両方の配列内の１つずつの
#   要素 (MACROn, PARAGRAPHn) において、@origmanarray 側の PARAGRAPHn
#   は文字列先頭に ".\"O " をつけて $fhdraft に出力し、続けて
#   @jamanarray 側の PARAGRAPHn をそのまま $fhdraft に出力します。
#   そのようにして draft 文面を、@origmanarray, @jamanarray 交互に
#   順次出力していきます。
#
#   @origmanarray と @jamanarray を同時にループした際の、それぞれの
#   MACROn は一致していることが前提ですが、不一致の場合、STDERR に
#   エラー出力します。このエラーは発生しないことを前提としますが、
#   念のための処理です。これが仮に起きた場合の出力結果はどうなるかは
#   想定していません。
#
sub output_proc {

  # @origmanarray (と同時に @jamanarray) の各要素を順にループ
  for (my $cnt = 0; $cnt < $len_orig_elements; $cnt++){

    # @origmanarray と @jamanarray の各要素 (MACROn, PARAGRAPHn) を取得
    my @each_orig = @{$origmanarray[$cnt]};
    my @each_ja   = @{$jamanarray[$cnt]};

    # @origmanarray 側と @jamanarray 側の MACROn が不一致
    if (@each_orig[0] ne @each_ja[0]) {
      print STDERR "Error: each element between orig and ja file should be matched.\n";
      print STDERR "  orig: ".@each_orig[0]."/".$cnt."\n";
      print STDERR "  ja:   ".@each_ja[0]."/".$cnt."\n";
    }

    my $first_flag = 0;

    # @origmanarray 側の PARAGRAPHn の行頭に ".\O " を付与して
    # $fhdraft へ出力します。
    # ただし PARAGRAPHn は改行文字も含む１つの文字列であるため、
    # あらかじめ "\n" で分割した文字配列としておき、
    # それをループしながら各行の先頭に".\O "を付与していきます。
    my @orig = split(/\n/, @each_orig[1]);
    foreach my $o (@orig) {
      if ($first_flag != 0) {
        print $fhdraft "\n";
        $first_flag = 1;
      }
      my $commented = $o;
      $commented =~ s/^/.\\"O /;
      print $fhdraft $commented."\n";
    }

    # @jamanarray 側の PARAGRAPHn はそのまま出力します。
    print $fhdraft @each_ja[1];

    # 次の PARAGRAPHn 出力に向けて罫線行をコメントで挿入します。
    print $fhdraft ".\\\"O ----------------------------------------\n";
  }
}
