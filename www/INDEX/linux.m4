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
_HEADER(`JM インデックス (Linux 専用)')

<P>
 Linux 専用のソフトウェアパッケージに入っている
 マニュアルページを翻訳したものです。
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

m4_esyscmd(../bin/list.perl ../../manual _WWWROOT linux.list | nkf -e)

_CREDITS

 <P>
  _GREY_ICON
  _LINK(./index.html,JM インデックスへ戻る)
 </P>

_BACK_TO_HOME

</body>
</html>

