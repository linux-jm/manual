[名前]
.\"O date \- print or set the system date and time
date \- システムの日付や時刻の表示、設定を行う
[説明]
.\" Add any additional description here
[DATE STRING]
.\" NOTE: keep this paragraph in sync with the one in touch.x
.\"O The --date=STRING is a mostly free format human readable date string
.\"O such as "Sun, 29 Feb 2004 16:21:42 -0800" or "2004-02-29 16:21:42" or
.\"O even "next Thursday".  A date string may contain items indicating
.\"O calendar date, time of day, time zone, day of week, relative time,
.\"O relative date, and numbers.  An empty string indicates the beginning
.\"O of the day.  The date string format is more complex than is easily
.\"O documented here but is fully described in the info documentation.
\-\-date=STRING は、ほぼフリーフォーマットで人間が読みやすい日付文字列です。
"Sun, 29 Feb 2004 16:21:42 \-0800" や "2004\-02\-29 16:21:42" などが使用でき、
"next Thursday" といった指定もできます。
日付文字列には、カレンダーの日付、1 日の時刻、タイムゾーン、
週の曜日、相対的な時刻、相対的な日付、数字を表す要素を含めることができます。
空の文字列は、その日の最初を示しします。
日付文字列の書式は、ここで説明できるほど簡単ではないが、
info 文書には完全な説明が載っています。
