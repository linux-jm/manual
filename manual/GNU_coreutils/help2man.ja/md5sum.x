[名前]
.\"O md5sum \- compute and check MD5 message digest
md5sum \- MD5 メッセージダイジェストの計算と照合を行う
[説明]
.\" Add any additional description here
.\"O [BUGS]
[バグ]
.\"O- The MD5 algorithm should not be used any more for security related purposes.
.\"O- Instead, better use an SHA\-2 algorithm, implemented in the programs
.\"O- sha224sum(1), sha256sum(1), sha384sum(1), sha512sum(1)
.\"O+ Do not use the MD5 algorithm for security related purposes.
.\"O+ Instead, use an SHA\-2 algorithm, implemented in the programs
.\"O+ sha224sum(1), sha256sum(1), sha384sum(1), sha512sum(1),
.\"O+ or the BLAKE2 algorithm, implemented in b2sum(1)
MD5 アルゴリズムはもはやセキュリティ関連の目的で使用すべきではありません。
代わりに、SHA\-2 アルゴリズムを使用するのが望ましい。
SHA\-2 アルゴリズムは sha224sum(1), sha256sum(1), sha384sum(1), sha512sum(1)
プログラムで実装されています。
