m4_dnl # index.m4: GNU m4 source for index.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # [その他に make 時点で依存を参照するファイル]
m4_dnl # jf_www.m4: 各種 M4 マクロ定義ファイル
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_define(_SUB_ONE)
m4_include(../jm_www.m4)
_EDIT_WARNING(index)
_HEADER(`man ページ閲覧ソフト')

<P>
 このページ以下では、
 man ページを閲覧するシステムの配布と情報提供を行います。
 各種ディストリビューションにおける
 日本語 man ページャの情報などを拡充していきたいと考えています。
</P>

<H2>man-1.5gja</H2>
<UL>
 <LI>_SELFLINK(man-1.5g-ja2.diff.gz)
</UL>
<P>
 man ページャのパッケージである man-1.5g 向けの日本語パッチです。
 ソースが必要な方はどうぞ。
 本体は
 _LINK(ftp://metalab.unc.edu/pub/Linux/apps/doctools/man/,metalab)
 などから ftp で入手してください。国内のミラーとしては
 _LINK(ftp://sunsite.sut.ac.jp/pub/archives/linux/sunsite-unc/apps/doctools/man/,理科大の sunsite)
 などを利用してください。 
</P>

<P>
 コンパイルや設定のやり方は
 _LINK(man-pager.html,日本語 man 環境の設定)
 を参考にしてください。
</P>

<H2>RPM パッケージ</H2>
<P>
 上記の日本語パッチを当てて作った RPM パッケージ群です。
</P>

<DL>
 <DT>_SELFLINK(man-1.5gjp-3.4.src.rpm)</DT>
 <DD>SRPM パッケージです</DD>

 <DT>_SELFLINK(man-1.5gjp-3.4.i386.glibc2_0.rpm)</DT>
 <DD>i386 glibc 2.0 向けの RPM パッケージです</DD>

 <DT>_SELFLINK(man-1.5gjp-3.4.i386.glibc2_1.rpm)</DT>
 <DD>i386 glibc 2.1 向けの RPM パッケージです</DD>
</DL>

_CREDITS

_BACK_TO_HOME

</BODY>
</HTML>

