m4_dnl # $Id: index.m4,v 1.53 2005/07/18 22:33:19 ysato Exp $
m4_dnl # index.m4: GNU m4 source for index.html.
m4_dnl # -------------------------------------------------------------------
m4_dnl #
m4_dnl # [その他に make 時点で依存を参照するファイル]
m4_dnl # jf_www.m4: 各種 M4 マクロ定義ファイル
m4_dnl #
m4_dnl # -------------------------------------------------------------------
m4_dnl
m4_include(jm_www.m4)
_EDIT_WARNING(index)
_HEADER(`JM Project')

 <DIV CLASS="copyright">
  m4_esyscmd(`env -u LANG date')
 </DIV>

_MIRROR_LIST

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<H2><A NAME="WHATSNEW">新着情報</A></H2>
<UL>
 <LI>配布アーカイブの準拠する標準を FSSTND から FHS に変更しました。
  詳細は
  _LINK(./news2002.html#20020915,こちら)
  をご覧ください。
  <SMALL>(2002/09/15)</SMALL>

 m4_esyscmd(`./bin/info-whole-archive.perl')

 <LI>_LINK(news.html,更新・追加情報)
   <SMALL>(m4_esyscmd(`./bin/file_date.perl news.m4'))</SMALL></LI>

 <LI>_LINK(announcement/index.html,以前のお知らせ)
</UL>

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<H2><A NAME="FILES">ファイル</A></H2>
<DL>
 <DT>_LINK(INDEX/index.html,JM インデックス)</DT>
 <DD>
  JM Project で翻訳されたマニュアルの一覧です。
  _LINK(INDEX/progress.html,翻訳作業の進行状況)
  も見ることができます。
 </DD>

 <DT>ソースディレクトリ (_LINK(manual/,roff), _LINK(pod/,pod))</DT>
 <DD>
  JM Project での作業イメージのスナップショットです。
 </DD>

 <DT>_LINK(html/,html ページのディレクトリ)</DT>
 <DD>
  リリース版のマニュアルを
  _LINK(html/man/man1/man2html.1.html,man2html)
  で html 化したページです。
 </DD>

 <DT>_LINK(download.html,ダウンロード)</DT>
 <DD>
  配布用アーカイブなどのダウンロードができるページです。
 </DD>
</DL>

<P>
 個々のファイルの扱いについては
 _LINK(copyright.html,著作権について)
 をご覧ください。
</P>

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
<H2><A NAME="ABOUTJM">JM Project について</A></H2>
<P>
 JM Project は日本語オンラインマニュアルパッケージの作成、
 配布を行なっているプロジェクトです。
 このプロジェクトにおける仕事には
</P>
<UL>
 <LI>_LINK(INDEX/progress.html,man page の翻訳・校正)
 <LI>_LINK(download.html,man page package の編集と配布)
  (_LINK(rpm/index.html,RPM/SRPM 配布))
 <LI>_LINK(man-ja/index.html,man コマンド等周辺環境の整備)
</UL>
<P CLASS="noindent">
 などがあります。また今後の課題としては、
<UL>
 <LI>翻訳済み man page の収集
 <LI>上流への連絡と、必要に応じて翻訳配布許可の明示的な取得
 <LI>上流パッケージへの翻訳のマージ
</UL>
<P CLASS="noindent">
 が挙げられます。
 活動の詳細や JM への参加方法については
 _LINK(guidance/index.html,JM 翻訳作業の手引き)
 をご覧ください。
 なおメールが配送されなくなったメンバーは、
 _LINK(mail_error.html,配送エラー一覧)
 を確認してください。
</P>

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<H2><A NAME="BUGREPORT">バグレポートをお寄せください</A></H2>
<P>
 JM Project で配布しているマニュアルに関して、
 誤字・誤訳その他お気づきの点がありましたら、
 JM@linux.or.jp までメールでお知らせください。
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
 <LI>_LINK(../JF/,JF Project)</LI>
 <LI>_LINK(http://www.jp.freebsd.org/man-jp/,Japanese Manual Project for FreeBSD)</LI>
 <LI>_LINK(http://xjman.dsl.gr.jp/,X Japanese Documentation Project)</LI>
 <LI>_LINK(http://www.samba.gr.jp/,日本 SAMBA ユーザ会)</LI>
 <LI>_LINK(http://www.unixuser.org/~euske/doc/openssh/jman/,OpenSSH 日本語マニュアルページ)</LI>
 <LI>_LINK(http://media.laic.u-hyogo.ac.jp/%7Ehayashi/internet/mh-plus.html,MH-plus project)
 <LI>_LINK(http://www.kobitosan.net/postfix/#Manual,Postfix のぺーじ)
 <LI>_LINK(http://www.postgresql.jp/document/,PostgreSQL 日本語ドキュメント)
m4_dnl  <LI>_LINK(http://www.cpan.jp/,CPAN.jp)</LI>
m4_dnl  足すならここかなあ.
</UL>

<!-- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -->
<H2>謝辞</H2>
<P>
 以下の皆様のご協力に感謝します。
</P>
<P>
 バグ情報をお寄せ下さったユーザのみなさん。
 マニュアルを寄贈してくださった
 _LINK(../JF/,JF) メンバー、
 Linux-MLメンバー、
 _LINK(http://www.jp.netbsd.org,NetBSD) jman project
 ・
 _LINK(http://www.jp.freebsd.org/man-jp/,FreeBSD jpman project)
 の方々。
 ML や www のリソースを提供してくださっている
 _LINK(http://jla.linux.or.jp,JLA)。
 _LINK(http://www.namazu.org/,Namazu Project)
 のみなさん。
</P>

_CREDITS

</BODY>
</HTML>

