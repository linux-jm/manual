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
_HEADER(`日本語 man 環境の設定')

<p>
 このページでは、日本語対応の
<a href="#jgroff">groff</a>
と
<a href="#jless">less</a>
をコンパイルし、
それにあわせて
<a href="#jman">man</a>
システムを設定、インストールする方法について解説します。
</p>

<blockquote>
 もちろんお使いのディストリビューションに日本語 groff, less, man が
 含まれている場合は、そちらを使うようにしましょう。
 ただしこの場合でも
 <a href="#ja-macro">groff の日本語マクロ</a>
 については目を通しておくと良いでしょう。
</blockquote>

<H2><a name="jgroff">jgroff のコンパイルとインストール</a></H2>
<p>
 まず日本語対応の groff を作ります。
 groff のバージョンは現在 1.11a まで行っているようですが、
 日本語化パッチ (0.99) が対応しているバージョンは 1.10 です。
 この日本語化パッチにより PS、 dvi 出力に日本語が
 使えるようになるほか、
 groff の出力オプションに日本語キャラクタ端末に対応した
 -Tnippon が追加されます。
</p>

<OL>
 <LI>本体 (groff-1.10.tar.gz) と日本語化パッチ
  (jgroff-0.99.diff.gz) を入手します。
  それぞれ
  _LINK(http://www.dsl.ics.tut.ac.jp/peppermints/archie.html,archie)
  すればたくさん出てくると思いますが、
  たとえば北海道大学のサーバなら
  _LINK(ftp://ftp.hipecs.hokudai.ac.jp/pub/GNU/,前者)、
  _LINK(ftp://ftp://ftp.hipecs.hokudai.ac.jp/pub/GNU/jp/,後者)
  ともに揃います。</LI>

 <LI>適当なディレクトリに上２つのソースを持ってきて、
   groff 本体を展開、日本語化パッチを当てます。
  <pre>
        tar zxf groff-1.10.tar.gz
        cd groff-1.10
        zcat ../jgroff-0.99.diff.gz | patch -p1
  </pre>

 <LI>ソースディレクトリで GNU ツールのお作法通り、
  <pre>
        ./configure --prefix=/usr --JTeX=ASCII
  </pre>
  します。
  <UL> 
   <LI>--prefix はインストールディレクトリの好みです
    (これを指定しないと /usr/local 以下に展開されます)。
    この指定だと font やマクロは /usr/share/groff 以下に展開されます。
    これを変更したい人は... INSTALL を良く読んでみて下さい(^_^;</LI>
   <LI>--JTeX は groff の吐く dvi ファイルを
    NTT 形式（デフォルト）から ASCII 形式にするためのオプションです。
    このあたりは groff-1.10 ディレクトリにできる README.jp
    を良く読んで下さい。</LI>
  </UL></LI>

 <LI>生成される Makefile では、 PostScript プリンタのページサイズを
   PAGE と言うマクロで指定しています。
   これはデフォルトでは letter になっていますが、
   A4 を使いたい場合は Makefile のコメントに従い PAGE=A4 に変更します。</LI>

 <LI>最後に
  <pre>
        make
        make install
  </pre>
  でおしまいです。</LI>

 <LI>gxditview (X 用ポストプロセッサ)
   が必要な方は、さらに
  <pre>
        cd xditview
        xmkmf
        make all
        make install install.man
  </pre>
  を実行すればインストールされます。</LI>
</ol>

<H2><a name="ja-macro">日本語 man マクロの追加</a></H2>
<P>
 ところで、以上のようにして作成した groff では、
 mdoc 形式の日本語 man ページを正しく整形できないことがあります。
 この点を解決したマクロ mandocj が花高さんによって作成されました。
</P>
<P>
 _SELFLINK(groff-tmac-ja.tar.gz)
 です。
</P>
<P>
 入手したら /usr/share/groff ディレクトリで
</p>
<pre>
        zcat groff-tmac-ja.tar.gz | tar xf -
</pre>
<p>
 のように展開すれば OK です。
</p>

<H2><a name="jless">日本語対応 less のコンパイルとインストール</a></H2>
<P>
 man ページを見るページャですが、やっぱり less が一番でしょう。
 バイナリパッケージも各種ディストリビューションから出ているでしょうが、
 以下のようにコンパイルも簡単です。
</P>

<OL>
 <LI><P>
   ソースを入手しましょう。ファイル名は
  </p>
  <ul>
   <li>less-332.tar.gz</LI>
   <li>less-332-iso242.patch.gz</LI>
  </ul>
  <p>
   です。やはり
   _LINK(http://www.dsl.ics.tut.ac.jp/peppermints/archie.html,archie)
   すればたくさん出てくると思いますが、
   ac.jp な人ならこちらも
   _LINK(ftp://ftp.hipecs.hokudai.ac.jp/pub/GNU/jp/less/,北大のサーバ)
   などがお薦めです。
  </p></LI>

 <LI><P>
   展開し、パッチ当てします。上の両者を置いたディレクトリから
  </P>
  <pre>
        zcat less-332.tar.gz | tar xf -
        cd less-332
        zcat ../less-332-iso242.patch.gz | patch -p1
  </pre>
  <p>
   で出来上り。
   <tt>INSTALL</tt>、
   <tt>README.iso</tt>、
   <tt>README.iso.jp</tt>
   などを良く読みます。
  </p></LI>

 <li><p>
   GNU なソフトのお作法に従い、コンパイル、インストールします。
   <tt>configure</tt> の <tt>--prefix</tt> は、
   インストールディレクトリの好みです。
  </p>
  <pre>
        ./configure --prefix=/usr
        make
        su
        # make install
  </pre></LI>

 <LI><p>
   日本語を閲覧するための環境変数は、ずばり JLESSCHARSET です。
   (t)csh な人なら ~/.(t)cshrc に
  </p>
  <pre>
        setenv JLESSCHARSET japanese
  </pre>
  <p>
   しておきましょう。 bash なら ~/.profile に
  </p>
  <pre>
        export JLESSCHARSET=japanese
  </pre>
  <p>
   ですね。
  </p></LI>

</ol>

<H2><a name="jman">日本語 man の設定</a></H2>

<p>
 以上で roff ソースのコンパイルと、その閲覧をできる環境が整いました。
 もし日本語のマニュアルページをすでにお持ちでしたら
</p>
<pre>
        groff -mandoc -Tnippon hoge.1 | less
</pre>
<p>
 などとしてみましょう。
 <a href="#ja-macro">先に日本語 groff マクロをインストールした</a>人は
</p>
<pre>
        groff -mandoc<b>j</b> -Tnippon hoge.1 | less
</pre>
<p>
 も試してみて下さい。
 無事に日本語が表示されたら man コマンドのインストールに移りましょう。
</p>

<ol>
 <li><p>
   man-1.5g.tar.gz という名前のアーカイブがオリジナルソースです。
   _LINK(http://www.dsl.ics.tut.ac.jp/peppermints/archie.html,archie)
   して近いところから入手されることをお薦めしますが、
   たとえば
   _LINK(ftp://sunsite.sut.ac.jp/pub/archives/linux/sunsite-unc/apps/doctools/man/,理科大の sunsite)
   などにも置いてあります。
  </p>
  <p>
   JRPM プロジェクトによって作成された
   _LINK(man-1.5g-ja2.diff.gz,日本語パッチ)
   がありますので、これも入手しておきます。
  </p></LI>

 <li><p>
   ファイルを展開し、パッチ当てします。
  </p>
  <pre>
        zcat man-1.5g.tar.gz | tar xf -
        cd man-1.5g
        zcat ../man-1.5g-ja2.diff.gz | patch -p1
  </pre></LI>

 <li><p>
   設定を
  </p>
  <pre>
        ./configure +lang en,ja +fsstnd -ask
  </pre>
  <p>
   によって行います。すでに FHS なファイルシステムの方は、
   +fsstnd は省略してください。
   ただほとんどの distribution はまだ FSSTND に準拠しているでしょうから、
   これで問題ないと思います。
   スクリプトが聞いてくる質問に対して、
   デフォルト以外を答えるところは以下の通り。
  </p>

  <dl>
   <dt>troff command to use</DT>
   <dd>/usr/bin/groff -Tps -mandocj</DD>

   <dt>Do you want to install non-english man pages?</DT>
   <dd>yes</DD>

   <dt>Install english pages?</DT>
   <dd>yes</DD>

   <dt>Install japanese pages?</DT>
   <dd>yes</DD>

   <dt>Do you want to install man setuid or setgid to some user
    who owns all the formatted man pages?</DT>
    <dd>yes</DD>
  </dl>
  <p>
   他にもファイルの置き場所などは適宜ご自分の好みに応じて変更して下さい。
  </p></LI>

 <li><p>
   make; make install で出来上がり。
  </p></LI>

 <li><p>
   /var/catman 以下を整備します (FSSTND 流儀)。
  </p>
  <ul>
   <li>/var/catman</LI>
   <li>/var/catman/ja_JP.ujis</LI>
   <li>/var/catman/local</LI>
   <li>/var/catman/local/ja_JP.ujis</LI>
   <li>/var/catman/X11</LI>
   <li>/var/catman/X11/ja_JP.ujis</LI>
  </ul>
  <p>
   等のディレクトリ下に cat1 〜 cat9, catn のディレクトリを作り、
   cat? ディレクトリのオーナーを man、グループを man、
   パーミッションを drwxr-xr-x に します。
   シェルスクリプトの一例を以下に示します。
  </p>
  <pre>
#!/bin/sh
mkdir -p /var/catman/ja_JP.ujis
mkdir -p /var/catman/local/ja_JP.ujis
mkdir -p /var/catman/X11/ja_JP.ujis

for n in 1 2 3 4 5 6 7 8 9 n o
do
        mkdir /var/catman/cat$n
        mkdir /var/catman/ja_JP.ujis/cat$n
        mkdir /var/catman/local/cat$n
        mkdir /var/catman/local/ja_JP.ujis/cat$n
        mkdir /var/catman/X11/cat$n
        mkdir /var/catman/X11/ja_JP.ujis/cat$n
done
chown -R man.man /var/catman/*
chmod -R 755 /var/catman/*
  </pre></LI>

 <li><p>
   環境変数を定義します。 tcsh なら /etc/csh.login などに
  </p>
  <pre>
        setenv LANG ja_JP.ujis
  </pre>
  <p>
   としておきます。（bash な人は適宜よろしく ;-) ）
  </p></LI>
</ol>

<p>
 以上で、 /usr/man/ja_JP.ujis に展開された日本語マニュアルを
</p>
<pre>
        man hoge
</pre>
<p>
 で見られるはずです。
 細かな部分は man.conf や MANPATH などで調整して下さい。
 "man man"、ですね :-)。
</p>

<p>
 マニュアルが nroff ソースで配布されていると、
</p>

<pre>
        man -t hoge | lpr -Pps
</pre>

<p>
 で Postscript での印刷もできるので、
 じっくり読みたい場合などにはこちらをおすすめです :-)
</p>

_CREDITS

 <P>
  <IMG SRC="../images/grey.png" WIDTH="14" ALT="* " HEIGHT="14">
  _LINK(index.html,man ページ閲覧ソフト に戻る)
 </P>

_BACK_TO_HOME

</BODY>
</HTML>
