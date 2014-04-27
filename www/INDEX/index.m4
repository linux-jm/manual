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
_HEADER(`JM インデックス')

<P>
 このページ以下では、
 JM で配布しているマニュアルページへの索引を提供します。
</P>

<H2>Linux 専用</H2>
<DL>
 <DT><A HREF="ldp.html">LDP man-pages</A>
  m4_esyscmd(`../bin/pagesize.perl ldp.html')
 </DT>
 <DD>
  _LINK(http://www.tldp.org/manpages/man.html,Linux Documentation Project)
  が配布している man ページ集です。
  システムコール、ライブラリ関数、特殊ファイルなど、
  特定のパッケージに依存しないページが収集されています。
 </DD> 

 <DT><A HREF="linux.html">Linux packages</A>
  m4_esyscmd(`../bin/pagesize.perl linux.html')
 </DT>
 <DD>
  Linux 専用のソフトウェアパッケージに属する man ページです。
  ディスク管理コマンド、 NIS, NFS など、
  主としてシステム関連のページからなります。
 </DD> 
</DL>

<H2>Unix 汎用</H2>
<DL>
 <DT><A HREF="gnu.html">GNU packages</A>
  m4_esyscmd(`../bin/pagesize.perl gnu.html')
 </DT>
 <DD>
  _LINK(http://www.gnu.org/,GNU)
  が配布しているソフトウェアパッケージに属する man ページです。
 </DD> 

 <DT><A HREF="misc.html">Miscellaneous packages</A>
  m4_esyscmd(`../bin/pagesize.perl misc.html')
 </DT>
 <DD>
  Unix 汎用のソフトウェアのうち、 GNU 以外のものを集めました。
  ncftp, fetchmail などが含まれます。
 </DD> 
</DL>

<H2>Info ページ</H2>
<DL>
 <DT>_LINK(INDEX/info.html,info ページ)</DT>
 <DD>
  info 形式で配布されているマニュアルです。
 _LINK(http://www.gnu.org/,GNU) ソフトウェアでは
 詳しいマニュアルは info 形式で配布されています。</LI>
 </DD>
</DL>

<H2>POD ページ</H2>
<DL>
 <DT><A HREF="pod.html">POD pages</A>
  m4_esyscmd(`../bin/pagesize.perl pod.html')
 </DT>
 <DD>
  Perl 関連パッケージで良く用いられる、
  POD (plain old documentation) 形式で書かれたページです。
  html での閲覧も可能です。
 </DD>
</DL>

 
<H2>作業用</H2>
<DL>
 <DT><A HREF="progress.html">Working Status</A>
  m4_esyscmd(`../bin/pagesize.perl progress.html')
 </DT>
 <DD>
  公開までにはまだ作業が必要なページです。
  主として JM Project 内部で利用するためのものです
 </DD>
</DL>

_CREDITS

_BACK_TO_HOME

</body>
</html>

