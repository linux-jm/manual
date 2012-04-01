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
_HEADER(`JM RPM/SRPM パッケージ')

<P>
ここでは、
JM Project (以下 JM) が配布している rpm パッケージについて説明します。
</P>
<UL>
 <LI>_LINK(#download,ダウンロード)</LI>
 <LI>_LINK(#class,パッケージの種類)</LI>
 <LI>_LINK(#install,インストール)</LI>
 <LI>_LINK(#rebuild,FHS から FSSTND への変更 (src.rpm の rebuild))</LI>
 <LI>_LINK(#customize,パッケージのカスタマイズ)</LI>
 <LI>_LINK(#naming,rpm パッケージの naming に関して)</LI>
</UL>

<H2><A name="download">ダウンロード</A></H2>

<P>
JM で配布している rpm パッケージは、以下のリンクより取得できます。
</P>

m4_esyscmd(../bin/link-rpms.perl _DATE ../)


<H2><A name="class">パッケージの種類</A></H2>

<H3>noarch.rpm</H3>
<P>
 JM で配布している man page を全て含んでいます。
 インストールすることで日本語 man page を利用できます。
 インストール先は FHS 2.x に従って、/usr/share/man/ja_JP.eucJP 配下です。
</P>

<BLOCKQUOTE>
 注: 従来、FSSTND に従ったディレクトリ構成
 (インストール先が /usr/man 配下) で配布していましたが、
 FHS に従ったインストール先に変更になりました。
 man page を使用するに当たり、
 この変更を特にユーザが意識する必要はありませんが、
 symbolic link を張っていた場合などは、注意が必要です。
</BLOCKQUOTE>

<P>
 /usr/share/man/ja_JP.eucJP 以外のディレクトリにインストールするなどの
 変更を加えたい場合は、
 別配布の src.rpm を自身の合わせて適宜修正した後、
 build 作業によってバイナリパッケージ (noarch.rpm) を作成し、
 インストールします(後述)。
</P>

<H3>src.rpm</H3>
<P>
 JM で配布している man page のソース、
 および noarch.rpm を構築するのに必要な spec ファイルを含みます。
 noarch.rpm のデフォルトを変更したい場合などに使用するパッケージです。
</P>


<H2><A name="install">インストール</A></H2>
<P>
 JM で配布している man page をインストールするには、
 noarch.rpm をroot 権限でインストールします。
 sudo あるいは su で root 権限に移行してインストール作業を行ってください。
</P>

<P>
 カレントディレクトリに取得した rpm パッケージを置き、
 以下のコマンドを実行します。
</P>

<BLOCKQUOTE><PRE>
$ su
(パスワード の入力)
# rpm -Uvh jman_pages-0.5-xxx.noarch.rpm
# exit
</PRE></BLOCKQUOTE>

<P>
man page は、/usr/share/man/ja_JP.eucJP/ 配下にインストールされます。
また必要な場合にのみ、ja_JP.eucJP に対し、
自動的に ja という symblic link が張られます。
</P>


<H2><A name="rebuild">FHS から FSSTND への変更 (src.rpm の rebuild)</A></H2>
<P>
FHS なインストール先 (/usr/share/man )ではなく
FSSTND なインストール先 (/usr/man) としたい場合は、
src.rpm の rebuild だけで対応可能です。
</P>

<P>
rebuild 時に RPM が /usr/lib/rpm/macros を読み、
システムが FHS か FSSTND かを判断する仕組みを利用しているため、
ほとんどの環境で spec ファイルの修正は不要です。
</P>

<P>
以下に src.rpm の rebuild についての手順を示します。
</P>

<BLOCKQUOTE>
注: 以下の例は、RPM のバージョンが 3.0.x 以降の場合です。
</BLOCKQUOTE>

<H3>1. 準備</H3>
<P>
rebuild 作業自体は、root あるいはユーザ権限でのどちらでも可能です。
root 権限で作業する場合は、/usr/src/redhat 以下
(RPM のデフォルト。既に存在しているはずです) での作業になります。
</P>

<BLOCKQUOTE>
 注: ただし、root 権限で作業を行うリスク(システム損傷など) を考えた場合、
 ユーザ権限での作業を強く勧めます。
</BLOCKQUOTE>

<P>
ユーザ権限で行う場合は、
ホームディレクトリに以下のファイル/ディレクトリがどちらも存在することを確認し、
無ければ作成します。
</P>

<DL>
 <DT>~/.rpmmacros</DT>
 <DD>
<BLOCKQUOTE><PRE>
%_topdir                /home/ユーザ名/rpm
%_builddir              %{_topdir}/BUILD
%_rpmdir                %{_topdir}/RPMS
%_sourcedir             %{_topdir}/SOURCES
%_specdir               %{_topdir}/SPECS
%_srcrpmdir             %{_topdir}/SRPMS
</PRE></BLOCKQUOTE>
  <P>
   ユーザ名にはあなたの login name を記述します。
  </P>
 </DD>

 <DT>~/rpm/ 以下のディレクトリ構成</DT>
 <DD>
<BLOCKQUOTE><PRE>
~/rpm/BUILD
     /RPMS/
     /SOURCES
     /SPECS
     /SRPMS
</PRE></BLOCKQUOTE>
 </DD>
</DL>

<H3>2. rebuild</H3>
<P>
以下のコマンドを実行します。
</P>
<BLOCKQUOTE><PRE>
$ rpm --rebuild jman_pages-0.5-xxx.src.rpm      (ユーザ権限の場合)
# rpm --rebuild jman_pages-0.5-xxx.src.rpm      (root 権限の場合)
</PRE></BLOCKQUOTE>

<H3>3. 作成したパッケージのインストール</H3>
<P>
パッケージはそれぞれ以下のディレクトリに作成されます。
</P>
<BLOCKQUOTE><PRE>
~/rpm/RPMS/noarch               (ユーザ権限の場合)
/usr/src/redhat/RPMS/noarch     (root 権限の場合)
</PRE></BLOCKQUOTE>

<P>
あとは、通常のバイナリパッケージと同様にインストールします。
</P>

<P>
パッケージが適切に作成されたかは、
以下のコマンドライン・オプションで判断可能です。
</P>

<BLOCKQUOTE><PRE>
$ rpm -qlp &lt;作成したパッケージ&gt;
</PRE></BLOCKQUOTE>


<H2><A name="customize">パッケージのカスタマイズ</A></H2>
<P>
 FHS、FSSTND 以外のインストール先や、
 その他 noarch.rpm のデフォルトを変更したい場合は、
 src.rpm の build が必要です。
</P>

<P>
 まず jman_pages-0.5-xxx.src.rpm を展開します。
</P>

<BLOCKQUOTE><PRE>
$ rpm -Uvh jman_pages-0.5-xxx.src.rpm   (ユーザ権限の場合)
# rpm -Uvh jman_pages-0.5-xxx.src.rpm   (root 権限の場合)
</PRE></BLOCKQUOTE>

<P>
~/rpm/SPECS (ユーザ権限で実行した場合) あるいは
/usr/src/redhat/SPECS (root 権限で実行した場合) に spec ファイルが、
また ~/rpm/SOURCES あるいは /usr/src/redhat/SOURCES にソースファイルが、
それぞれインストールされます。
</P>

<P>
希望する変更を spec ファイルに行った後、パッケージを build します。
</P>

<BLOCKQUOTE><PRE>
$ rpm -bb jman_pages.spec               (ユーザ権限の場合)
# rpm -bb jman_pages.spec               (root 権限の場合)
</PRE></BLOCKQUOTE>

<P>
オプションには以下のようなものがあります。適宜使い分けてください。
</P>


<BLOCKQUOTE><PRE>
-bb     バイナリパッケージを build      (noarch.rpm ができます)
-bs     ソースパッケージを build        (src.rpm ができます)
-ba     上記 2つを同時に build          (noarch.rpm + src.rpm ができます)
</PRE></BLOCKQUOTE>

<P>
詳細については、ディストリビューション付属のマニュアルや、
JF の RPM-BUILD-HOWTO などを参照してください。
</P>


<H2><A name="naming">rpm パッケージの naming に関して</A></H2>
<P>
パッケージ名は man-pages-ja にしようという案がありましたが、
man-pages-ja というのはあくまでも英語の man-pages パッケージに対応した
日本語man ページのパッケージ名であるべきで、
JM の配布物はそれ以外のものも多く含んでいるので、
このような naming になっています。
</P>


<H2><A name="acknowledgement">謝辞</A></H2>
<P>
RPM を作成した PJE プロジェクト、
ならびに(株)レーザーファイブ、
そしてマニュアル作成に携わった多くの人々に感謝します。
また、linux-users ML/JM ML において、
rpm パッケージ作成に関してご助言くださった皆様に感謝します。
</P>

_CREDITS

 <P>
  <IMG SRC="../images/grey.png" WIDTH="14" ALT="* " HEIGHT="14">
  _LINK(../index.html,マニュアルアーカイブのダウンロードに戻る)
 </P>

_BACK_TO_HOME

</BODY>
</HTML>

