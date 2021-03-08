[名前]
.\"O runcon \- run command with specified security context
runcon \- 指定されたセキュリティコンテキストでコマンドを実行する
[説明]
.\"O Run COMMAND with completely-specified CONTEXT, or with current or
.\"O transitioned security context modified by one or more of LEVEL,
.\"O ROLE, TYPE, and USER.
指定したセキュリティコンテキストで COMMAND を実行します。
セキュリティコンテキストは、完全に指定する方法と、
現在もしくは遷移セキュリティコンテキストを元に
変更する LEVEL, ROLE, TYPE, USER を指定する方法があります。
.PP
.\"O If none of \fI-c\fR, \fI-t\fR, \fI-u\fR, \fI-r\fR, or \fI-l\fR, is specified,
.\"O the first argument is used as the complete context.  Any additional
.\"O arguments after \fICOMMAND\fR are interpreted as arguments to the
.\"O command.
\fI-c\fR, \fI-t\fR, \fI-u\fR, \fI-r\fR, \fI-l\fR がどれも指定されていない場合、
最初の引き数が完全なコンテキストとして使用されます。
\fICOMMAND\fR より後ろに追加で引き数を指定することができ、
これらは実行するコマンドへの引き数として渡されます。
.PP
.\"O Note that only carefully-chosen contexts are likely to successfully
.\"O run.
実行が成功するには、コンテキストを注意深く選択しなければならない点に
注意して下さい。
