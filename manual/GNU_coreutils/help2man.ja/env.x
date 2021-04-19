[名前]
.\"O env \- run a program in a modified environment
env \- 変更した環境でプログラムを実行する
[説明]
.\" Add any additional description here
.\"O+ [OPTIONS]
.\"O+ .SS "\-S/\-\-split\-string usage in scripts"
.\"O+ The
.\"O+ .B \-S
.\"O+ option allows specifying multiple parameters in a script.
.\"O+ Running a script named
.\"O+ .B 1.pl
.\"O+ containing the following first line:
.\"O+ .PP
.\"O+ .RS
.\"O+ .nf
.\"O+ #!/usr/bin/env \-S perl \-w \-T
.\"O+ \&...
.\"O+ .fi
.\"O+ .RE
.\"O+ .PP
.\"O+ Will execute
.\"O+ .B "perl \-w \-T 1.pl".
.\"O+ .PP
.\"O+ Without the
.\"O+ .B '\-S'
.\"O+ parameter the script will likely fail with:
.\"O+ .PP
.\"O+ .RS
.\"O+ .nf
.\"O+ /usr/bin/env: 'perl \-w \-T': No such file or directory
.\"O+ .fi
.\"O+ .RE
.\"O+ .PP
.\"O+ See the full documentation for more details.
.\"O+ .PP
.\"O+ .SS "\-\-default-signal[=SIG]" usage
.\"O+ This option allows setting a signal handler to its default
.\"O+ action, which is not possible using the traditional shell
.\"O+ trap command.  The following example ensures that seq
.\"O+ will be terminated by SIGPIPE no matter how this signal
.\"O+ is being handled in the process invoking the command.
.\"O+ 
.\"O+ .PP
.\"O+ .RS
.\"O+ .nf
.\"O+ sh \-c 'env \-\-default-signal=PIPE seq inf | head \-n1'
.\"O+ .fi
.\"O+ .RE
.\"O+ .PP
.\"O+ 
.\"O+ [NOTES]
.\"O+ POSIX's exec(2) pages says:
.\"O+ .RS
.\"O+ "many existing applications wrongly assume that they start with certain
.\"O+ signals set to the default action and/or unblocked.... Therefore, it is best
.\"O+ not to block or ignore signals across execs without explicit reason to do so,
.\"O+ and especially not to block signals across execs of arbitrary (not closely
.\"O+ cooperating) programs."
.\"O+ .RE
.\"O+ 
.\"O [SEE ALSO]
[関連項目]
sigaction(2), sigprocmask(2), signal(7)
