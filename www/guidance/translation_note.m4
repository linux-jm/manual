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
_EDIT_WARNING(translation_note)
_HEADER(`翻訳の指針')

<P>
 この文章は JM Project における
 man page 翻訳作業に関する指針です。
 翻訳者のみなさんには余計な手間になるとは思いますが、
 より良い日本語マニュアルを作成するためにご協力ください。
</P>

<H2>マニュアル本文のフォーマットについて</H2>
<P>
 本来のフォーマットや著作権を尊重するために、
 一次配布フォーマットは roff 形式を採用します。
 また roff での作業が困難である場合には、
 その旨を _LINK(mailto:linuxjm-discuss@lists.sourceforge.jp,JM-ML)
 まで連絡してください。他に roff 化のボランティアを募集します。
</P>

<P>
 全体としての文体の統一のため、
 特に理由がなければ常体 (「である」調) を用いてください。
 マニュアルページの語尾としては、
</P>
<PRE>
「〜だ。」
「〜である。」
「〜する。」
「〜できる。」
「〜となる。」
</PRE>

<P CLASS="noindent">
 などを使用してください。
</P>

<P>
 句読点は「、」および「。」を使用してください。ただし、英単語や英文の
 部分の区切りには「,」「.」を用いてもかまいません。
</P>


<H2><A NAME="commentize">原文のコメント化</A></H2>
<P>
 校正作業や改版作業の便宜を図るため、
 できれば原文をコメントで残しておいてください。
 ただし「原文に元からあったコメント」と区別するため、
 「.\"O」という形式のコメントとしてください
 (O はアルファベット o の大文字)。
 登録システムは、リリース版を作成するときに
 このコメントを自動的に除去します。
</P>

<P>
 コメント化には以下のような内容の
 _LINK(commentate.awk,awk スクリプト)
 を用いると良いでしょう。
</P>

<PRE>
#!/usr/bin/awk -f
{
    if ($0 ~ /^\.\\"/) {print}
    else {printf(".\\\"O %s\n", $0)}
}
</PRE>

<P>
 これをオリジナルの roff ファイルに対して
</P>

<pre>
        awk -f commentate.awk ar.1 &gt; ar.1.draft
</pre>

<P CLASS="noindent">
 のように用い、 ar.1.draft に対して作業をします。
</P>

<P>
 以上の作業では原文はすべてコメントアウトされてしまいますが、
 .TH 行や .TP 行のように、
 そのまま翻訳版にも残しておきたい行もあると思います。
 このような行を元に戻す作業には vi を用いるのが楽でしょう。
 vim 系なら作業ディレクトリに
</P>

<PRE>
        map ^T 5xj
</PRE>

<P>
 というような内容の .vimrc ファイルを置いておきます (^T は Ctrl-T です)。
 コメント化した roff ファイルを vi で開き、
 アンコメントしたい行の先頭で Ctrl-T を打てば、
 次々に取っていけます。失敗した場合は u で undo。
</P>


<H2>著作権表示について</H2>
<P>
 roff 形式において roff のコメントとして書かれている著作権表示は、
 英文のまま残してください。
 さらにその後にコメントとして、
 英文で翻訳者の著作権表示を加えてください。
 翻訳者の権利表示の例を以下に示します。
</P>

<PRE>
.\"
.\" Japanese Version Copyright (c) 1996 HANATAKA Shinya
.\"         all rights reserved.
.\" Translated Wed Nov 20 17:42:39 JST 1996
.\"         by HANATAKA Shinya
</PRE>

<P>
 本文 (man コマンドの整形結果で見える部分) に著作権表示がある場合には、
 それも原文のまま残してください。
</P>

<P>
 原文に著作権表示が含まれていない場合には、
 個別対応になると思いますので
 JM@linux.or.jp で相談してください。
</P>

<P>
 GNU のマニュアルページにはマニュアルページ中に著作権表示のないもの
 がありますが、その場合、上記の翻訳版著作権に加えて、以下の文をマニュ
 アルの先頭に付加してください。
</P>

<PRE>
.\"   Copyright (C) 1994-1999 Free Software Foundation, Inc.
.\"
.\"   Permission is granted to make and distribute verbatim copies of
.\"this
.\"manual provided the copyright notice and this permission notice are
.\"preserved on all copies.
.\"
.\"   Permission is granted to copy and distribute modified versions of
.\"this manual under the conditions for verbatim copying, provided that
.\"the entire resulting derived work is distributed under the terms of a
.\"permission notice identical to this one.
.\"
.\"   Permission is granted to copy and distribute translations of this
.\"manual into another language, under the above conditions for modified
.\"versions, except that this permission notice may be stated in a
.\"translation approved by the Foundation.
.\"
</PRE>


<H2>特殊用語の翻訳について</H2>
<P>
 特殊用語の翻訳は以下の方針に従ってください。
</P>
<UL>
 <LI>コマンド名、関数名、引き数名などは翻訳せず、
  アルファベットのままで記述する。</LI>

 <LI>英文との相互参照や用語の統一を簡単にするために、
  専門用語を翻訳する場合には、
  訳語の後ろにかっこつきで原語を併記してください。
  <PRE>
例)      共有メモリ(shared memory)
  </PRE></LI>

 <LI>専門用語は無理に日本語にせずカタカナ表記を使用する。
  <PRE>
例)      ×記述子(descriptor)
         ○ディスクリプター(descriptor)
  </PRE></LI>
</UL>

<P>
 マニュアル間での訳語の統一を行うために、
 できれば専門用語について単語リストを作成してください。
 単語リストは、それぞれのマニュアルページの頭に
 以下のような roffのコメント形式で埋め込んでください。
</P>
<PRE>
.\"WORD:        effective uid           実効ユーザーID
.\"WORD:        out-of-band             帯域外
.\"WORD:        physical address        物理アドレス
.\"WORD:        signal                  シグナル
</PRE>

<H2>音引きについて</H2>
<P>
 片仮名語の語尾の音引き(ー)には以下の方針を用いてください。
</P>
<UL>
 <LI>既に日本語になっているものについてはそれを用いる。</LI>
 <LI>できるだけ原語の発音に近い表現を用いる。
  <PRE>
例)      ×メモリー(memory)
         ○メモリ(memory)
  </PRE></LI>
 <LI>それ以外の場合に語尾の音引きは省略しない。
  <PRE>
例)      ×コンパイラ(compiler)
         ○コンパイラー(compiler)
  </PRE></LI>
</UL>

<H2>セクション名について</H2>
<P>
 セクション名については以下のものを使用してください。
</P>
<PRE>
ACKNOWLEDGEMENTS        謝辞
ARGUMENTS               引き数
AUTHOR                  著者
AUTHORS                 著者
BUGS                    バグ
CAVEATS                 警告
COMMAND LINE OPTIONS    オプション
COMPATIBILITY           移植性
CONFORMING TO           準拠
CONFORMS TO             準拠
COPYING                 著作権
COPYRIGHT               著作権
DESCRIPTION             説明
DIAGNOSTICS             返り値
ENVIRONMENT             環境変数
ENVIRONMENT VARIABLES   環境変数
ERROR                   エラー
ERRORS                  エラー
EXAMPLE                 例
EXAMPLES                例
EXIT CODES              返り値
EXTENSION               拡張
EXTENSIONS              拡張
FILES                   ファイル
FLAGS                   フラグ
HISTORY                 履歴
KEYWORDS                キーワード
LIMITATIONS             制限
NAME                    名前
NOTE                    注意
NOTES                   注意
OPTION                  オプション
OPTIONS                 オプション
PARAMETERS              引き数
PORTABILITY             移植性
RESTRICTIONS            制限
RETURN VALUE            返り値
SEE ALSO                関連項目
SOLICITATION            要請
STANDARDS               準拠
SYNOPSIS                書式
SYNTAX                  書式
VERSION                 バージョン
WARNING                 警告
WARNINGS                警告
</PRE>

<P>
 その他、何かありましたら
 JM@linux.or.jp まで問い合わせてください。
</P>

_CREDITS

 <P>
  <IMG SRC="../images/grey.png" WIDTH="14" ALT="* " HEIGHT="14">
  _LINK(index.html,JM 翻訳作業の手引きに戻る)
 </P>

_BACK_TO_HOME

</BODY>
</HTML>

