'\" Copyright (C) 1998-2020 Free Software Foundation, Inc.
'\"
'\" This is free software.  You may redistribute copies of it under the terms
'\" of the GNU General Public License <https://www.gnu.org/licenses/gpl.html>.
'\" There is NO WARRANTY, to the extent permitted by law.
[名前]
.\"O chmod \- change file mode bits
chmod \- ファイルのモードビットを変更する
[説明]
.\"O This manual page
.\"O documents the GNU version of
.\"O .BR chmod .
.\"O .B chmod
.\"O changes the file mode bits of each given file according to
.\"O .IR mode ,
.\"O which can be either a symbolic representation of changes to make, or
.\"O an octal number representing the bit pattern for the new mode bits.
このマニュアルページでは GNU バージョンの \fBchmod\fP について説明しています。
\fBchmod\fP は指定されたファイルのモードビット (mode bits) を
\fImode\fP に基いて変更します。
\fImode\fP は、変更内容の記号表現 (記号モード)か、新しく設定するモードビットの
ビットパターンを表す 8 進数 (数値モード) のどちらかで指定します。
.PP
.\"O The format of a symbolic mode is [\c
.\"O \fBugoa\fP.\|.\|.][[\fB-+=\fP][\fIperms\fP.\|.\|.].\|.\|.],
.\"O where
.\"O .I "perms"
.\"O is either zero or more letters from the set
.\"O \fBrwxXst\fP, or a single letter from the set \fBugo\fP.
.\"O Multiple symbolic
.\"O modes can be given, separated by commas.
記号モードの書式は
[\fBugoa\fP.\|.\|.][[\fB-+=\fP][\fIperms\fP.\|.\|.].\|.\|.] です。
\fIperms\fP には、\fBrwxXst\fP のうち 0 個以上の文字か、
\fBugo\fP のいずれか 1 文字を指定します。
コンマで区切って、複数の記号表現を指定することができます。
.PP
.\"O A combination of the letters \fBugoa\fP controls which users' access
.\"O to the file will be changed: the user who owns it (\fBu\fP), other
.\"O users in the file's group (\fBg\fP), other users not in the file's
.\"O group (\fBo\fP), or all users (\fBa\fP).  If none of these are given,
.\"O the effect is as if (\fBa\fP) were
.\"O given, but bits that are set in the umask are not affected.
\fBugoa\fP の組み合わせで、そのファイルに対するユーザのアクセス権限を制御します。
それぞれ、ファイルの所有者のユーザ (\fBu\fP)、ファイルのグループに属する
所有者以外のユーザ (\fBg\fP)、ファイルのグループに属さない他のユーザ (\fBo\fP)、
全てのユーザ (\fBa\fP) を意味します。
\fBugoa\fP のどれも指定されなかった場合、(\fBa\fP) が指定されたのと同じ効果を
持ちますが、umask でセットされているビットは変更されません。
.PP
.\"O The operator \fB+\fP causes the selected file mode bits to be added to
.\"O the existing file mode bits of each file; \fB-\fP causes them to be
.\"O removed; and \fB=\fP causes them to be added and causes unmentioned
.\"O bits to be removed except that a directory's unmentioned set user and
.\"O group ID bits are not affected.
\fB+\fP 演算子は、各ファイルの現在のファイルモードビットに
指定されたファイルモードビットを追加します。
\fB\-\fP を指定すると、指定されたファイルモードビットが削除されます。
\fB=\fP を指定すると、指定されたファイルモードビットが追加され、
指定されていないビットが削除されます。
ただし、指定されていないビットのうち、ディレクトリの set\-user\-ID と
set\-group\-ID は影響を受けません。
.PP
.\"O The letters \fBrwxXst\fP select file mode bits for the affected users:
.\"O read (\fBr\fP), write (\fBw\fP), execute (or search for directories)
.\"O (\fBx\fP), execute/search only if the file is a directory or already
.\"O has execute permission for some user (\fBX\fP), set user or group ID
.\"O on execution (\fBs\fP), restricted deletion flag or sticky bit
.\"O (\fBt\fP).  Instead of one or more of these letters, you can specify
.\"O exactly one of the letters \fBugo\fP: the permissions granted to the
.\"O user who owns the file (\fBu\fP), the permissions granted to other
.\"O users who are members of the file's group (\fBg\fP),
.\"O and the permissions granted to users that are in neither of the two preceding
.\"O categories (\fBo\fP).
文字 \fBrwxXst\fP で設定対象のユーザのファイルモードビットを選択します:
読み出し許可 (\fBr\fP)、書き込み許可 (\fBw\fP)、
実行許可 (もしくはディレクトリの検索許可) (\fBx\fP)、
ファイルがディレクトリの場合もしくはファイルが
実行許可/検索許可 (ただし、ファイルがディレクトリの場合か、
あるユーザに対してすでに実行許可がある場合のみ) (\fBX\fP)、
実行時にユーザ ID もしくはグループ ID を設定する (\fBs\fP)、
削除制限 (restricted deletion) フラグもしくはスティッキービット (\fBt\fP)。
これらの文字を一つ以上指定する代わりに、
文字 \fBugo\fP のいずれか一つだけを指定することもできます:
ファイルを所有するユーザに付与されたアクセス許可 (\fBu\fP)、
ファイルのグループの所有者以外のメンバーに付与されたアクセス許可 (\fBg\fP)、
前記のどちらでもないユーザに付与されたアクセス許可 (\fBo\fP)。
.PP
.\"O A numeric mode is from one to four octal digits (0\-7), derived by
.\"O adding up the bits with values 4, 2, and 1.  Omitted digits are
.\"O assumed to be leading zeros.
.\"O The first digit selects the set user ID (4) and set group ID (2) and
.\"O restricted deletion or sticky (1) attributes.  The second digit
.\"O selects permissions for the user who owns the file: read (4), write (2),
.\"O and execute (1); the third selects permissions for other users in the
.\"O file's group, with the same values; and the fourth for other users not
.\"O in the file's group, with the same values.
数値モードでは 1 桁から 4 桁の 8 進数 (0\-7) で指定します。
その値は、ビットを値 4, 2, 1 に対応させたものを加算することで得られます。
省略された桁は先頭にある  0 とみなされます。
1 桁目では、set\-user\-ID (4)、set\-group\-ID (2)、削除制限/スティッキー (1)
といった属性を指定します。
2 桁目では、ファイルを所有するユーザに対するアクセス許可を指定します:
読み出し許可 (4)、書き込み許可 (2)、実行許可 (1)。
3 桁目ではファイルのグループの所有者以外のメンバーに対するアクセス許可を
指定します: 値は 2 桁目と同じ。
4 桁目ではファイルのグループに属さないユーザに対するアクセス許可を
指定します: 値は 2 桁目と同じ。
.PP
.\"O .B chmod
.\"O never changes the permissions of symbolic links; the
.\"O .B chmod
.\"O system call cannot change their permissions.  This is not a problem
.\"O since the permissions of symbolic links are never used.
.\"O However, for each symbolic link listed on the command line,
.\"O .B chmod
.\"O changes the permissions of the pointed-to file.
.\"O In contrast,
.\"O .B chmod
.\"O ignores symbolic links encountered during recursive directory
.\"O traversals.
\fBchmod\fP はシンボリックリンクのアクセス許可を変更することはありません。
\fBchmod\fP システムコールがシンボリックリンクのアクセス許可を変更できないからです。
シンボリックリンクのアクセス許可が使われることは決してないため、
これは問題にはなりません。
しかし、\fBchmod\fP は、コマンドラインで列挙されたシンボリックリンク
それぞれについて、シンボリックリンクが指しているファイルのアクセス許可を
変更します。その一方で、\fBchmod\fP は再帰的にディレクトリを辿っている途中で
見つけたシンボリックリンクは無視します。
.\"O .SH "SETUID AND SETGID BITS"
.SH "SETUID ビットと SETGID ビット"
.\"O .B chmod
.\"O clears the set-group-ID bit of a
.\"O regular file if the file's group ID does not match the user's
.\"O effective group ID or one of the user's supplementary group IDs,
.\"O unless the user has appropriate privileges.  Additional restrictions
.\"O may cause the set-user-ID and set-group-ID bits of
.\"O .I MODE
.\"O or
.\"O .I RFILE
.\"O to be ignored.  This behavior depends on the policy and
.\"O functionality of the underlying
.\"O .B chmod
.\"O system call.  When in
.\"O doubt, check the underlying system behavior.
\fBchmod\fP は、ファイルのグループ ID がユーザの実効グループ ID とも
ユーザの追加グループ ID とも一致せず、
ユーザが適切な特権を持っていない場合は、
通常のファイルの set\-group\-ID ビットをクリアします。
他にも追加の制限があり、\fIMODE\fP や \fIRFILE\fP の set\-user\-ID ビットや
set\-group\-ID ビットが無視される場合があります。どのような動作になるかは
裏で呼び出される \fBchmod\fP システムコールのポリシーや機能に依存します。
疑わしい点がある場合は、動作しているシステムの動作を確認して下さい。
.PP
.\"O+ For directories
.\"O .B chmod
.\"O- preserves a directory's set-user-ID and set-group-ID bits unless you
.\"O+ preserves set-user-ID and set-group-ID bits unless you
.\"O explicitly specify otherwise.  You can set or clear the bits with
.\"O symbolic modes like
.\"O .B u+s
.\"O and
.\"O- .BR g\-s ,
.\"O- and you can set (but not clear) the bits with a numeric mode.
.\"O+ .BR g\-s .
.\"O+ To clear these bits for directories with a numeric mode requires
.\"O+ an additional leading zero, or leading = like
.\"O+ .B 00755
.\"O+ , or
.\"O+ .B =755
\fBchmod\fP は、明示的に指定した場合を除き、ディレクトリの set\-user\-ID ビットと
set\-group\-ID ビットを保持します。
これらのビットの設定や解除を行うには、
記号モードで \fBu+s\fP and \fBg\-s\fP のように指定します。
また、数値モードで対応するビットを指定することでビットの設定ができます
(解除はできません)。
.\"O .SH "RESTRICTED DELETION FLAG OR STICKY BIT"
.SH 削除制限フラグとスティッキービット
.\"O The restricted deletion flag or sticky bit is a single bit, whose
.\"O interpretation depends on the file type.  For directories, it prevents
.\"O unprivileged users from removing or renaming a file in the directory
.\"O unless they own the file or the directory; this is called the
.\"O .I "restricted deletion flag"
.\"O for the directory, and is commonly found on world-writable directories
.\"O like \fB/tmp\fP.  For regular files on some older systems, the bit
.\"O saves the program's text image on the swap device so it will load more
.\"O quickly when run; this is called the
.\"O .IR "sticky bit" .
削除制限フラグ (restricted deletion flag) とスティッキービット (sticky bit) は
1 ビットの情報で、ファイル種別によりその意味が変わります。
ディレクトリの場合、このビットがセットされていると、
非特権ユーザは、自分が所有者のファイルやディレクトリ以外は
そのディレクトリにあるファイルの削除や名前変更ができなくなります。
この機能はディレクトリの \fB削除制限フラグ\fP と呼ばれ、
\fB/tmp\fP などの誰でも書き込みできるディレクトリでは一般的に使われています。
いくつかの古いシステムでは、通常のファイルでこのビットが設定されている場合、
そのプログラムのテキストイメージがスワップデバイス上に保持され、
実行時により早くファイルがロードできるようになります。
この機能は \fBスティッキービット\fP と呼ばれます。
.\"O .SH OPTIONS
.SH オプション
[関連項目]
chmod(2)
