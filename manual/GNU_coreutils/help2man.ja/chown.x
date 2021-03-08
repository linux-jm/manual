'\" Copyright (C) 1998-2016 Free Software Foundation, Inc.
'\"
'\" This is free software.  You may redistribute copies of it under the terms
'\" of the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.
'\" There is NO WARRANTY, to the extent permitted by law.
[名前]
.\"O chown \- change file owner and group
chown \- ファイルの所有者とグループを変更する
[説明]
.\"O This manual page
.\"O documents the GNU version of
.\"O .BR chown .
.\"O .B chown
.\"O changes the user and/or group ownership of each given file.  If
.\"O only an owner (a user name or numeric user ID) is given, that user is made the
.\"O owner of each given file, and the files' group is not changed.  If the
.\"O owner is followed by a colon and a group name (or numeric group ID),
.\"O with no spaces between them, the group ownership of the files is
.\"O changed as well.  If a colon but no group name follows the user name,
.\"O that user is made the owner of the files and the group of the files is
.\"O changed to that user's login group.  If the colon and group are given,
.\"O but the owner is omitted, only the group of the files is changed;
.\"O in this case,
.\"O .B chown
.\"O performs the same function as
.\"O .BR chgrp .
.\"O If only a colon is given, or if the entire operand is empty, neither the
.\"O owner nor the group is changed.
このマニュアルページでは GNU バージョンの \fBchown\fP について説明しています。
\fBchown\fP は指定された各ファイルのユーザとグループの所有権を変更します。
所有者 (ユーザ名か数値のユーザ ID) だけが指定された場合、そのユーザが
指定された各ファイルの所有者に設定されます。ユーザ名の後ろにコロン (':') と
グループ名 (もしくは数値のグループ ID) が続く場合、ファイルのグループ
も設定されます (所有者とコロン以降の間にスペースを入れてはいけません)。
ユーザ名の後ろにグループ名なしでコロンだけが続く場合、
ファイルの所有者がそのユーザに変更され、ファイルのグループが
そのユーザのログイングループに変更されます。
ユーザ名は指定されず、コロンとグループだけが指定された場合、
ファイルのグループだけが変更されます。
この場合、\fBchown\fP は \fBchgrp\fP と同じ機能を実行していることになります。
コロンだけが指定された場合や、処理対象が空の場合、所有者もグループも変更されません。
.\"O .SH OPTIONS
.SH オプション
[関連項目]
chown(2)
