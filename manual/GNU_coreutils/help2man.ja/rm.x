'\" Copyright (C) 1998-2020 Free Software Foundation, Inc.
'\"
'\" This is free software.  You may redistribute copies of it under the terms
'\" of the GNU General Public License <https://www.gnu.org/licenses/gpl.html>.
'\" There is NO WARRANTY, to the extent permitted by law.
[名前]
.\"O rm \- remove files or directories
rm \- ファイルやディレクトリの削除を行う
[説明]
.\"O This manual page
.\"O documents the GNU version of
.\"O .BR rm .
.\"O .B rm
.\"O removes each specified file.  By default, it does not remove
.\"O directories.
このマニュアルページでは GNU バージョンの \fBrm\fP について説明しています。
\fBrm\fP は指定された各ファイルを削除します。
デフォルトでは、ディレクトリを削除しません。
.P
.\"O If the \fI\-I\fR or \fI\-\-interactive=once\fR option is given,
.\"O and there are more than three files or the \fI\-r\fR, \fI\-R\fR,
.\"O or \fI\-\-recursive\fR are given, then
.\"O .B rm
.\"O prompts the user for whether to proceed with the entire operation.  If
.\"O the response is not affirmative, the entire command is aborted.
オプション \fI\-I\fP か \fI\-\-interactive=once\fP が指定され、
4 個以上のファイルを削除するか、\fI\-r\fP か \fI\-\-recursive\fP が指定された場合、
\fBrm\fP は操作全体を実行してよいかをユーザに確認します。
返事が肯定的なものでなかった場合には、コマンド全体が中止されます。
.P
.\"O Otherwise, if a file is unwritable, standard input is a terminal, and
.\"O the \fI\-f\fR or \fI\-\-force\fR option is not given, or the
.\"O \fI\-i\fR or \fI\-\-interactive=always\fR option is given,
.\"O .B rm
.\"O prompts the user for whether to remove the file.  If the response is
.\"O not affirmative, the file is skipped.
それ以外の場合で、ファイルが書き込み不可で、標準入力が端末で、
オプション \fI\-f\fP と \fI\-\-force\fP のどちらも指定されていない場合と、
オプション \fI\-i\fP か \fI\-\-interactive=always\fP が指定されている場合は、
\fBrm\fP はそのファイルを削除してよいかをユーザに確認します。
返事が肯定的なものでなかった場合には、そのファイルはスキップされます。
.\"O .SH OPTIONS
.SH オプション
[関連項目]
unlink(1), unlink(2), chattr(1), shred(1)
