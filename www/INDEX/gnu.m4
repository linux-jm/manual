m4_dnl # $Id: gnu.m4,v 1.5 2000/08/02 10:00:53 nakano Exp $
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
_HEADER(`JM インデックス (GNU)')

<P>
 _LINK(http://www.gnu.org/,GNU Project)
 によって配布されているマニュアルページです。
</P>
<P>
 最新版の翻訳は <STRONG>太字</STRONG> で、
 旧版の翻訳は 細字 で示します。
 リンクのないページはまだ翻訳されていません。
</P>
<P>
 作業状況は
 _LINK(./progress.html,翻訳作業インデックス)
 をご覧ください。
</P>
<BLOCKQUOTE>
 _LINK(#gnumaniak,gnumaniak)
 は
 _LINK(http://macula.net/lightside/,Ragnar Hojland Espinosa)
 氏によって
 _LINK(http://macula.net/lightside/ftp.html,配布)
 されているマニュアルパッケージです。
 最近 GNU では info ファイルに力を入れており、
 マニュアルページは簡略化される傾向にありますが、
 gnumaniak はこれを補うべく作成されました。
 JM Project では、今後 GNU のマニュアルに関しては
 gnumaniak のものを優先して翻訳していく方針になっています。
</BLOCKQUOTE>

m4_esyscmd(../bin/list.perl ../../manual _WWWROOT gnu.list)

_CREDITS

 <P>
  _GREY_ICON
  _LINK(./index.html,JM インデックスへ戻る)
 </P>

_BACK_TO_HOME

</body>
</html>

