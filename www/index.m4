m4_dnl # index.m4: GNU m4 source for index.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # [その他に make 時点で依存を参照するファイル]
m4_dnl # jm_www.m4: 各種 M4 マクロ定義ファイル
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_include(jm_www.m4)
_EDIT_WARNING(index)
_HEADER(`JM Project')

m4_dnl _MIRROR_LIST

JM プロジェクトは、主に Linux 関連のマニュアルページの日本語ページを翻訳・公開しています。

<!--
<H2>全文検索</H2>
<div id="googlesearch">
<script>
  (function() {
    var cx = '009079235866882919939:6xvbv842dji';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//www.google.com/cse/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<gcse:search></gcse:search>
</div>
-->

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<H2><A NAME="WHATSNEW">新着情報</A></H2>
<UL>

<LI>_LINK(INDEX/gnu.html#GNU_diffutils, GNU diffutils 3.12 の翻訳)を更新しました。
<SMALL>(2025/11/07)</SMALL>

<LI>_LINK(INDEX/gnu.html#GNU_gzip, GNU gzip 1.14 の翻訳)を更新しました。
<SMALL>(2025/11/05)</SMALL>

<LI>_LINK(INDEX/gnu.html#GNU_which, GNU which 2.23 の翻訳)を更新しました。
<SMALL>(2025/10/27)</SMALL>

<LI>_LINK(INDEX/gnu.html#GNU_binutils, GNU binutils の翻訳)を一部更新しました。
<SMALL>(2025/10/17)</SMALL>

<LI>_LINK(INDEX/gnu.html#GNU_gzip, GNU gzip 1.12 の翻訳)を更新しました。
詳細は_LINK(news/index.html#20220624,こちら)。
<SMALL>(2022/6/24)</SMALL>

<LI>_LINK(INDEX/misc.html#qpdf, qpdf 10.6.3 の翻訳)を追加しました。
<SMALL>(2022/6/14)</SMALL>

<LI>_LINK(INDEX/linux.html#upower, upower 0.99.17 の翻訳)を追加しました。
<SMALL>(2022/6/13)</SMALL>

<LI>_LINK(INDEX/gnu.html#GNU_grub, GNU grub 2.06 の翻訳)を追加/更新しました。
詳細は_LINK(news/index.html#20220612,こちら)。
<SMALL>(2022/6/12)</SMALL>

<LI>_LINK(INDEX/gnu.html#GNU_gdb, GNU gdb 11.2 の翻訳)を追加/更新しました。
<SMALL>(2022/6/11)</SMALL>

<LI>_LINK(INDEX/linux.html#kmod, kmod 29 の翻訳)を追加しました。
詳細は_LINK(news/index.html#20220607,こちら)。
<SMALL>(2022/6/7)</SMALL>

<LI>_LINK(INDEX/gnu.html#GNU_gsl, GNU gsl 2.7.1 の翻訳)を追加しました。
<SMALL>(2022/6/6)</SMALL>

<LI>_LINK(INDEX/misc.html#dblatex, dblatex 0.3.12 の dblatex.1 の翻訳)を追加しました。
<SMALL>(2022/6/5)</SMALL>

<LI>_LINK(INDEX/gnu.html#GNU_autoconf, GNU autoconf 2.71 の翻訳)を追加しました。
<SMALL>(2022/6/4)</SMALL>

<LI>_LINK(INDEX/misc.html#meson, meson 0.62.1 の meson.1 の翻訳)を追加しました。
<SMALL>(2022/05/31)</SMALL>

<LI>_LINK(INDEX/misc.html#nginx, nginx 1.21.6 の nginx.8 の翻訳)を追加しました。
<SMALL>(2022/05/30)</SMALL>

</UL>

<UL>
m4_dnl m4_esyscmd(`./bin/info-whole-archive.perl')

 <LI>_LINK(news/index.html,すべての更新・追加情報)</LI>

 <LI>_LINK(announcement/index.html,以前のお知らせ)
 (マニュアル更新以外のお知らせです)
</UL>

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<H2><A NAME="FILES">JM インデックス</A></H2>
JM Project で翻訳された_LINK(INDEX/,マニュアルの一覧)です。
<UL>
 <LI>_LINK(INDEX/ldp.html,LDP man-pages) :
  _LINK(https://www.kernel.org/doc/man-pages/,Linux man-pages project)
  が配布している man ページ集です。
  システムコール、ライブラリ関数などのマニュアルが収録されています。</LI>

 <LI>_LINK(INDEX/linux.html,Linux packages) :
 Linux 専用のソフトウェアパッケージに属する man ページです。</LI>

 <LI>_LINK(INDEX/gnu.html,GNU packages) :
 _LINK(http://www.gnu.org/,GNU) が配布している
 ソフトウェアパッケージに属する man ページです。</LI>

 <LI>_LINK(INDEX/misc.html,Miscellaneous packages) :
 Unix 汎用のソフトウェアのうち、 GNU 以外のものを集めました。</LI>

 <LI>_LINK(INDEX/info.html,info ページ) :
 info 形式で配布されているマニュアルです。
 _LINK(http://www.gnu.org/,GNU) ソフトウェアでは詳しいマニュアルは info 形式で配布されています。</LI>
</UL>

<P>
 個々のファイルの扱いについては
 _LINK(copyright.html,著作権について)
 をご覧ください。
</P>

<H2><A NAME="DOWNLOAD">ダウンロード</A></H2>

配布用アーカイブなどは、
_DOWNLOADLINK(GitHub Releases) からダウンロードができます。

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<H2><A NAME="ABOUTJM">JM Project の活動</A></H2>
<P>
 翻訳状況、翻訳手順、管理者向け情報などは
 _LINK(/guide/,JM Project Guide)
 に掲載しています。
</P>

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<H2><A NAME="BUGREPORT">バグレポートをお寄せください</A></H2>
<P>
 JM Project で配布しているマニュアルに関して、
 誤字・誤訳その他お気づきの点がありましたら、
 linuxjm-discuss@lists.sourceforge.net までメールでお知らせください。
 作業メーリングリストに配送されますが、
 メンバーでなくても投稿できます。
 1 バイトの修正でも大歓迎です。
</P>

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<H2><A NAME="LINK">リンク</A></H2>
<P>
 日本語の文書やマニュアルを配布している個人/プロジェクトへのリンクです。
</P>
<UL>
 <LI>_LINK(http://linuxjf.osdn.jp/,JF Project)</LI>
 <LI>_LINK(http://openlab.ring.gr.jp/doc-ja/,Doc-ja Archive Project)</LI>
 <LI>_LINK(http://www.jp.freebsd.org/man-jp/,Japanese Manual Project for FreeBSD)</LI>
 <LI>_LINK(http://xjman.dsl.gr.jp/,X Japanese Documentation Project)</LI>
 <LI>_LINK(http://wiki.samba.gr.jp/,日本 SAMBA ユーザ会)</LI>
 <LI>_LINK(http://euske.github.io/openssh-jman/,OpenSSH 日本語マニュアルページ)</LI>
 <LI>_LINK(http://media.laic.u-hyogo.ac.jp/%7Ehayashi/internet/mh-plus.html,MH-plus project)
 <LI>_LINK(http://www.kobitosan.net/postfix/#Manual,Postfix のぺーじ)
 <LI>_LINK(http://www.postgresql.jp/document/,PostgreSQL 日本語ドキュメント)
m4_dnl  <LI>_LINK(http://www.cpan.jp/,CPAN.jp)</LI>
m4_dnl  足すならここかなあ.
</UL>

_CREDITS

</BODY>
</HTML>
