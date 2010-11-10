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
_HEADER(`JM-man-view.el の使い方')

<P>
JM-man-view とは、メール本文が
man page のファイルのものを整形して表示するための
Emacs Lisp です
(Emacs 上で動くメーラを使っている人は特に便利です)。
</P>

<H2>必要なもの</H2>
<UL>
<LI>_LINK(JM-man-view.el,JM-man-view.el)</LI>
<LI>_LINK(http://centaur.maths.qmw.ac.uk/Emacs/WoMan/,woman.el)
    (emacs21 以降では標準添付になっており、特に入手の必要はありません)</LI>
<LI>Emacs (woman.el が XEmacs 上では動かないので XEmacs はダメです)
</UL>

<H2>設定方法</H2>
<OL>
<LI>
 <P>woman.el と JM-man-view.el を load-path に置きます。
  具体的には、例えば ~/elisp/ に両者を置き、 .emacs に
 </P>
<PRE>
(setq load-path (cons (expand-file-name "~/elisp") load-path))
</PRE>
 <P>
  と追記するとよいでしょう。
 </P>

<LI>
 <P>
  .emacs に以下を追記します。
 </P>
<PRE>
;; woman
(autoload 'woman "woman"
  "Decode and browse a UN*X man page." t)
(autoload 'woman-find-file "woman"
  "Find, decode and browse a specific UN*X man-page file." t)
;; JM-man-view
(autoload 'JM-man-view "JM-man-view" nil t)
(autoload 'JM-man-mail-view "JM-man-view" nil t)
</PRE>
</OL>
<P>
以上で設定は終わりです。
</P>

<H2>使いかた</H2>
<P>
メールが表示されているバッファに移動して、
M-x JM-man-view とすれば、
woman によって整形されたマニュアルが別フレーム
(X ならウィンドウ) に表示されます。
Wanderlust/Mew を使っている場合は、
Summary モードで
M-x JM-man-mail-view とすればマニュアルが表示されます。
</P>

<H2>メールの条件</H2>
<P>
JM-man-view.el は、整形対象とするバッファにおける
roff 文書に対して、以下の仮定を置いています。
</P>
<OL>
<LI>マニュアル部分の先頭行は、roffのコメントである .\" で始まる (行頭が .\")
<LI>メール本文の最後まで manual である(= 本文の末尾にコメント等がない)
</OL>
<P>
_LINK(./mailformat.html#JMpost,JMpost)
で投げられるマニュアルは上の条件を満たしますので、
特に意識しなくともかまいません。
</P>

<H2>制限</H2>
<P>
 現在のところ、woman.el は mdoc 形式のマニュアルの変換ができないようです。
 したがって JM-man-view.el でも、
 この形式のマニュアルは閲覧できないことになります。
</P>

_CREDITS

 <P>
  <IMG SRC="../images/grey.png" WIDTH="14" ALT="* " HEIGHT="14">
  _LINK(index.html,JM 翻訳作業の手引きに戻る)
 </P>

_BACK_TO_HOME

</BODY>
</HTML>

