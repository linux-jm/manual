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
_HEADER(`JM インデックス (作業状況)')

<P>
 このページは JM Project における翻訳作業の進行状況です。
 プロジェクトメンバーは予約されていない項目をみつけたら、
 どんどん JM-ML で作業宣言してください。
</P>

<BLOCKQUOTE>
 <STRONG>注意:</STRONG>
 このページからリンクが張られた
 ドラフトページ、オリジナルページの再配布は禁止します。
</BLOCKQUOTE>

<H2>リストの説明</H2>
<P>
 各ページの前についているマークは以下のような状況をそれぞれ示します。
</P>
<PRE>
×: 未翻訳、翻訳予約なし。
▲: 未翻訳、翻訳作業中。
△: 未翻訳、ドラフト提出済み、校正予約なし。
●: 未翻訳、ドラフト提出済み、校正中。
☆: 旧版の翻訳あり、作業予約なし。
■: 旧版の翻訳あり、翻訳作業中。              
□: 旧版の翻訳あり、ドラフト提出済み、校正予約なし。
◆: 旧版の翻訳あり、ドラフト提出済み、校正中。
ｃ: 旧版の翻訳 (contribution) あり。
</PRE>

<!--
<H2>作業上のメモ</H2>
<UL>
 <LI>
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
  gnumaniak のものを優先して翻訳していく方針になっています
  (LDP の sec1 もありますが、こちらより gnumaniak を優先)。
 </LI>
</UL>
-->

m4_esyscmd(../bin/list_progress.perl ../.. | nkf -w)

_CREDITS

 <P>
  _GREY_ICON
  _LINK(./index.html,JM インデックスへ戻る)
 </P>

_BACK_TO_HOME

</body>
</html>

