'\" Copyright (C) 2018-2020 Free Software Foundation, Inc.
'\"
'\" This is free software.  You may redistribute copies of it under the terms
'\" of the GNU General Public License <https://www.gnu.org/licenses/gpl.html>.
'\" There is NO WARRANTY, to the extent permitted by law.
[名前]
.\"O basenc \- Encode/decode data and print to standard output
basenc \- データをエンコード/デコードして標準出力に表示する
[説明]
.\" Add any additional description here
.\"O [ENCODINGS EXAMPLES]
[エンコード例]
.PP
.nf
.RS
$ printf '\\376\\117\\202' | basenc \-\-base64
/k+C

$ printf '\\376\\117\\202' | basenc \-\-base64url
_k-C

$ printf '\\376\\117\\202' | basenc \-\-base32
7ZHYE===

$ printf '\\376\\117\\202' | basenc \-\-base32hex
VP7O4===

$ printf '\\376\\117\\202' | basenc \-\-base16
FE4F82

$ printf '\\376\\117\\202' | basenc \-\-base2lsbf
011111111111001001000001

$ printf '\\376\\117\\202' | basenc \-\-base2msbf
111111100100111110000010

$ printf '\\376\\117\\202\\000' | basenc \-\-z85
@.FaC
.RE
.fi
