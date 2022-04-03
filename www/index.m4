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

_BUILD_DATE

m4_dnl _MIRROR_LIST

JM プロジェクトは、主に Linux 関連のマニュアルページの日本語ページを翻訳・公開しています。

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

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<H2><A NAME="WHATSNEW">新着情報</A></H2>
<UL>

 <LI>_LINK(INDEX/linux.html#GNU_ed, GNU ed の ed.1 の man pages の翻訳)を公開しました。
 <SMALL>(2022/04/03)</SMALL>

 <LI>_LINK(INDEX/linux.html#at, at-3.2.4 の at.1 の man pages の翻訳)を公開しました。なお、at の最新版は 3.2.5 ですが、3.2.4 のマニュアルはそのままお使いいただけます。
 <SMALL>(2022/03/31)</SMALL>

 <LI>_LINK(INDEX/ldp.html,LDP man-pages 5.10 対応版)を更新しました。
  詳細は_LINK(news/index.html#20210713,こちら)。
 <SMALL>(2021/07/13)</SMALL>

 <LI>_LINK(INDEX/ldp.html,LDP man-pages 5.10 対応版)を更新しました。
  詳細は_LINK(news/index.html#20210623,こちら)。
 <SMALL>(2021/06/23)</SMALL>

 <LI>_LINK(INDEX/gnu.html#GNU_coreutils,GNU coreutils の翻訳)を 8.32 に更新しました。
 <SMALL>(2021/05/01)</SMALL>

 <LI>_LINK(INDEX/ldp.html,LDP man-pages 5.10 対応版)を公開しました。
 <SMALL>(2021/04/13)</SMALL>

 <LI>_LINK(INDEX/linux.html#util-linux, util-linux 2.36 の dmesg.1 setterm.1 の man pages の翻訳)を公開しました。
 <SMALL>(2021/03/03)</SMALL>

</UL>

<UL>
m4_dnl m4_esyscmd(`./bin/info-whole-archive.perl')

 <LI>_LINK(news/index.html,すべての更新・追加情報)
   <SMALL>(m4_esyscmd(`./bin/file_date.perl news/index.m4'))</SMALL></LI>

 <LI>_LINK(announcement/index.html,以前のお知らせ)
 (マニュアル更新以外のお知らせです)
</UL>

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<H2><A NAME="SEARCH">man on WWW</A></H2>
<P>
 man コマンドの簡単な WWW 版です。
 ページ名・セクション番号を選択すると、
 リリース版の html ページへ飛びます。
 候補が複数ある時は一覧が出ます。
</P>
<FORM METHOD="GET" ACTION="_MANCGI">
 <TABLE>
  <TR>
   <TH ALIGN="left">ページ名</TH>
   <TD>
    <INPUT TYPE="TEXT" NAME="Pagename" SIZE="40">
    <INPUT TYPE="SUBMIT" NAME="submit" VALUE="Search!">
   </TD>
  </TR>

  <TR>
   <TH ALIGN="left">対象セクション</TH>
   <TD>
    <INPUT TYPE=CHECKBOX NAME="Sec1" CHECKED>1
    <INPUT TYPE=CHECKBOX NAME="Sec2" CHECKED>2
    <INPUT TYPE=CHECKBOX NAME="Sec3" CHECKED>3
    <INPUT TYPE=CHECKBOX NAME="Sec4" CHECKED>4
    <INPUT TYPE=CHECKBOX NAME="Sec5" CHECKED>5
    <INPUT TYPE=CHECKBOX NAME="Sec6" CHECKED>6
    <INPUT TYPE=CHECKBOX NAME="Sec7" CHECKED>7
    <INPUT TYPE=CHECKBOX NAME="Sec8" CHECKED>8
    [<STRONG>_LINK(section.html,→セクションとは?)</STRONG>]
   </TD>
  </TR>
 </TABLE>

</FORM>

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

 <LI>_LINK(INDEX/pod.html,POD ページ) :
 Perl 関連パッケージで良く用いられる、 POD (plain old documentation) 形式で書かれたページです。</LI>
</UL>

<P>
 個々のファイルの扱いについては
 _LINK(copyright.html,著作権について)
 をご覧ください。
</P>

<H2><A NAME="DOWNLOAD">ダウンロード</A></H2>

配布用アーカイブなどは、
_LINK(download.html,こちら) からダウンロードができます。

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<!--
<H2>全文検索</H2>
<P>
_LINK(http://www.namazu.org/,Namazu)
を使った html ページの全文検索です。
</P>

<FORM METHOD="GET" ACTION="_NAMAZU"> -->
<!--hidden parameters--> <!--
<INPUT TYPE="HIDDEN" NAME="whence" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="sort"   VALUE="score">
<INPUT TYPE="HIDDEN" NAME="dbname" VALUE="JM">

<TABLE>
 <TR>
  <TH>検索式</TH>
  <TD>
   <INPUT TYPE="TEXT" NAME="key" SIZE="40">
   <INPUT TYPE="SUBMIT" NAME="submit" VALUE="Search!">
  </TD>
 </TR>

 <TR>
  <TH>表示件数</TH>
  <TD>
   <SELECT NAME="max">
    <OPTION VALUE="10">10
    <OPTION SELECTED VALUE="20">20
    <OPTION VALUE="30">30
    <OPTION VALUE="50">50
    <OPTION VALUE="100">100
   </SELECT>

   <STRONG>要約表示</STRONG>
   <SELECT NAME="format">
    <OPTION SELECTED VALUE="long">ON
    <OPTION VALUE="short">OFF
   </SELECT>
   <STRONG>[<A HREF="_NAMAZU?dbname=JM">検索のヒント</A>]</STRONG>
  </TD>
 </TR>
</TABLE>
</FORM>
-->

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
 linuxjm-discuss@lists.osdn.me までメールでお知らせください。
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
