'\" Copyright (C) 1998-2012 Free Software Foundation, Inc.
'\"
'\" This is free software.  You may redistribute copies of it under the terms
'\" of the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.
'\" There is NO WARRANTY, to the extent permitted by law.
[名前]
.\"O du \- estimate file space usage
du \- ファイルのディスク使用量を推定する
[説明]
.\" Add any additional description here
[パターン]
.\"O PATTERN is a shell pattern (not a regular expression).  The pattern
.\"O .BR ?
.\"O matches any one character, whereas
.\"O .BR *
.\"O matches any string (composed of zero, one or multiple characters).  For
.\"O example,
.\"O .BR *.o
.\"O will match any files whose names end in
.\"O .BR .o .
.\"O Therefore, the command
.\"O .IP
.\"O .B du --exclude=\(aq*.o\(aq
.\"O .PP
.\"O will skip all files and subdirectories ending in
.\"O .BR .o
.\"O (including the file
.\"O .BR .o
.\"O itself).
PATTERN は (正規表現ではなく) シェルのパス名指定パターンです。
パターン
.BR ?
は任意の 1 文字にマッチし、
.BR *
は (0 文字、1 文字、複数文字の) 任意の文字列にマッチします。
例えば、
.BR *.o
はファイル名が
.BR .o
で終わる全てのファイルにマッチします。
したがって、コマンド
.IP
.B du --exclude=\(aq*.o\(aq
.PP
では、名前が
.BR .o
で終わるファイルとサブディレクトリが全てスキップされます
(ファイル
.B .o
自身もスキップされます)。
