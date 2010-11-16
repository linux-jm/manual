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
_HEADER(`JM インデックス (LDP man-pages)')
<P>
 _LINK(http://www.tldp.org/,Linux Documentation Project)
 によって配布されているマニュアルページです。
</P>
<P>
 最新版の翻訳は <STRONG>太字</STRONG> で、
 旧版の翻訳は 細字 で示します。
 リンクのないページはまだ翻訳されていません。
</P>
<P>
 作業状況は
 _LINK(./progress.html#LDP_man-pages,翻訳作業インデックス)
 をご覧ください。
</P>

m4_esyscmd(../bin/list_ldp.perl ../../manual _WWWROOT | nkf -e)

_CREDITS

 <P>
  _GREY_ICON
  _LINK(./index.html,JM インデックスへ戻る)
 </P>

_BACK_TO_HOME

</body>
</html>

