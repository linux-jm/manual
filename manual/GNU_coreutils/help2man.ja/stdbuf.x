'\" Copyright (C) 2009-2012 Free Software Foundation, Inc.
'\"
'\" This is free software.  You may redistribute copies of it under the terms
'\" of the GNU General Public License <http://www.gnu.org/licenses/gpl.html>.
'\" There is NO WARRANTY, to the extent permitted by law.
[名前]
.\"O stdbuf \-
.\"O Run COMMAND, with modified buffering operations for its standard streams.
stdbuf \- 標準入出力ストリームのバッファ動作を変更して、COMMAND を実行する
[説明]
.\" Add any additional description here
[例]
.B tail -f access.log | stdbuf -oL cut -d \(aq \(aq -f1 | uniq
.br
.\"O This will immedidately display unique entries from access.log
このコマンドでは access.log の一意なエントリがあると直ちに出力されます。
[バグ]
.\"O On GLIBC platforms, specifying a buffer size, i.e. using fully buffered mode
.\"O will result in undefined operation.
glibc 環境では、バッファサイズを指定した場合 (つまり、完全に
バッファリングを行うモードを使用した場合) の動作は未定義です。
