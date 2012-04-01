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
_HEADER(`セクションとは?')

<P>
 マニュアルページはそれぞれ特定のセクションに所属しています。
 セクションは通常 1 つの数字 (文字) で表記されます。
 各セクションの意味を JF プロジェクトの
 _LINK(http://linuxjf.sourceforge.jp/JFdocs/Man-Page.html,Man-page HOWTO)
 より以下に抜粋します。
</P>

<BLOCKQUOTE>
<TABLE>
<TR><TH>1</TH><TD>だれもが実行できるユーザコマンド</TD></TR>
<TR><TH>2</TH><TD>システムコール、つまり、カーネルが提供する関数</TD></TR>
<TR><TH>3</TH><TD>サブルーチン、つまり、ライブラリ関数</TD></TR>
<TR><TH>4</TH><TD>デバイス、つまり、/dev ディレクトリのスペシャルファイル</TD></TR>
<TR><TH>5</TH><TD>ファイルフォーマットの説明、例 /etc/passwd</TD></TR>
<TR><TH>6</TH><TD>ゲーム（説明不要だろうネ）</TD></TR>
<TR><TH>7</TH><TD>その他  例: マクロパッケージや取り決め的な文書</TD></TR>
<TR><TH>8</TH><TD>システム管理者だけが実行できるシステム管理用のツール</TD></TR>
<TR><TH>9</TH><TD>Linux 独自のカーネルルーチン用のドキュメンテーション</TD></TR>
<TR><TH>n</TH><TD>新しいドキュメンテーション: よりふさわしい場所に移動されるだろう</TD></TR>
<TR><TH>o</TH><TD>古いドキュメンテーション　猶予期間として保存されているもの</TD></TR>
<TR><TH>l</TH><TD>独自のシステムについてのローカルなドキュメンテーション</TD></TR>
</TABLE>
</BLOCKQUOTE>

<P CLASS="noindent">
 マニュアルのファイル名は通常
 <STRONG>foo.1</STRONG>
 のように表記され、
 最後の <STRONG>.1</STRONG>
 にあたる部分がセクションを表します。
 例えば
 <STRONG><A HREF="html/LDP_man-pages/man2/mount.2.html">mount.2</A></STRONG>
 は mount システムコールの説明ですし、
 <STRONG><A HREF="html/util-linux/man8/mount.8.html">mount.8</A></STRONG>
 はディスクマウントを行うシステムコマンドの説明になるわけです。
</P>
<P>
 現在 JM Project には、
 セクション 1〜8 までのページがあります。
 セクション 9 のページも作業予定がありますが、
 今のところリリース版のページはまだありません。
</P>

_CREDITS

_BACK_TO_HOME

</BODY>
</HTML>

