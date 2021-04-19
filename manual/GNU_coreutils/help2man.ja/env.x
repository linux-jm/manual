[名前]
.\"O env \- run a program in a modified environment
env \- 変更した環境でプログラムを実行する
[説明]
.\" Add any additional description here
.\"O [OPTIONS]
[オプション]
.\"O .SS "\-S/\-\-split\-string usage in scripts"
.SS "スクリプトでの \-S/\-\-split\-string の使い方"
.\"O The
.\"O .B \-S
.\"O option allows specifying multiple parameters in a script.
.\"O Running a script named
.\"O .B 1.pl
.\"O containing the following first line:
.B \-S
オプションを使うと、スクリプト内で複数の引き数を指定することができます。
.B 1.pl
という名前のスクリプトの最初の行が以下のようになっている場合、
このスクリプトを実行すると、
.PP
.RS
.nf
#!/usr/bin/env \-S perl \-w \-T
\&...
.fi
.RE
.PP
.\"O Will execute
.\"O .B "perl \-w \-T 1.pl".
.B "perl \-w \-T 1.pl"
が実行されます。
.PP
.\"O Without the
.\"O .B '\-S'
.\"O parameter the script will likely fail with:
.B '\-S'
パラメーターを指定しない場合、
このスクリプトはおそらく以下のような感じで失敗することでしょう。
.PP
.RS
.nf
/usr/bin/env: 'perl \-w \-T': No such file or directory
.fi
.RE
.PP
.\"O See the full documentation for more details.
.\" amotoki - full documentation は info を指しているので
.\" info であることがわかるように意訳している
さらなる詳細は info 形式のドキュメントを参照してください。
.PP
.\"O .SS "\-\-default-signal[=SIG]" usage
.SS "\-\-default-signal[=SIG]" の使い方
.\"O This option allows setting a signal handler to its default
.\"O action, which is not possible using the traditional shell
.\"O trap command.  The following example ensures that seq
.\"O will be terminated by SIGPIPE no matter how this signal
.\"O is being handled in the process invoking the command.
このオプションを使うと、シグナルハンドラーに
デフォルトの動作を設定できます。
これは、従来のシェルの trap コマンドではできません。
以下の例では、このコマンドを起動したプロセスでこのシグナルが
どのように処理されていたとしても、
seq は必ず SIGPIPE で終了します。

.PP
.RS
.nf
sh \-c 'env \-\-default-signal=PIPE seq inf | head \-n1'
.fi
.RE
.PP

.\"O [NOTES]
[注意]
.\"O POSIX's exec(2) pages says:
.\"O .RS
.\"O "many existing applications wrongly assume that they start with certain
.\"O signals set to the default action and/or unblocked.... Therefore, it is best
.\"O not to block or ignore signals across execs without explicit reason to do so,
.\"O and especially not to block signals across execs of arbitrary (not closely
.\"O cooperating) programs."
.\"O .RE
POSIX の exec(2) のページには以下のような記載がある。
.RS
「多くのアプリケーションは、
特定のシグナルがデフォルト動作に設定されていたりブロックされていない状態で
アプリケーションが開始される、という誤った前提を置いている。。。。
そのため、最も良いのは、明確な理由がない限りは exec の前後でシグナルを
ブロックしたり無視したりしないことだ。
特に、(密接に連携しているわけではない) 任意のプログラム間の exec では
シグナルをブロックしないのがよい。」
.RE

.\"O [SEE ALSO]
[関連項目]
sigaction(2), sigprocmask(2), signal(7)
