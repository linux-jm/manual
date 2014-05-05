'\" Copyright (C) 1998-2013 Free Software Foundation, Inc.
'\"
'\" This is free software.  You may redistribute copies of it under the terms
'\" of the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.
'\" There is NO WARRANTY, to the extent permitted by law.
[名前]
.\"O df \- report file system disk space usage
df \- ファイルシステムのディスク使用量を報告する
[説明]
.\"O This manual page
.\"O documents the GNU version of
.\"O .BR df .
.\"O .B df
.\"O displays the amount of disk space available on the file system
.\"O containing each file name argument.  If no file name is given, the
.\"O space available on all currently mounted file systems is shown.  Disk
.\"O space is shown in 1K blocks by default, unless the environment
.\"O variable POSIXLY_CORRECT is set, in which case 512-byte blocks are
.\"O used.
このマニュアルページでは GNU バージョンの \fBdf\fP について説明しています。
\fBdf\fP は、引き数で指定された各ファイル名を含むファイルシステムで
利用可能なディスク容量を表示します。
ファイル名が指定されなかった場合、現在マウントされている全ての
ファイルシステムについて利用可能なディスク容量を表示します。
ディスク容量はデフォルトでは 1K ブロック単位で表示されます。
環境変数 POSIXLY_CORRECT が設定されている場合は、デフォルトで
512 バイトブロック単位になります。
.PP
.\"O If an argument is the absolute file name of a disk device node containing a
.\"O mounted file system,
.\"O .B df
.\"O shows the space available on that file system rather than on the
.\"O file system containing the device node (which is always the root
.\"O file system).  This version of
.\"O .B df
.\"O cannot show the space available on unmounted file systems, because on
.\"O most kinds of systems doing so requires very nonportable intimate
.\"O knowledge of file system structures.
引き数がマウントされたファイルシステムが含まれる
ディスクデバイスノードの絶対ファイル名であった場合には、
デバイスノードを含むファイルシステムではなく、
指定されたファイルシステムの利用可能な容量を表示します
(デバイスノードを含むファイルシステムは常に root ファイルシステムになります)。
このバージョンの
.B df
ではマウントされていないファイルシステムの利用可能な容量は表示できません。
これを行うためには、ほとんどのシステムで、ファイルシステムの構造に関する
細かな情報が必要であり、その情報はシステム間で互換性のある形にはなって
いないからである。
.\"O .SH OPTIONS
.SH オプション
