m4_dnl # $Id: pod.m4,v 1.2 2000/08/02 10:00:58 nakano Exp $
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
_HEADER(`podマニュアル翻訳の手引き')


<H2>概要</H2>

<H3>この手引きの目的</H3>

<P>
 このドキュメントは、JM プロジェクトにおいて
 pod ドキュメントの翻訳作業をする手引きです。
</P>
<P>
 _LINK(index.html,JM 翻訳作業の手引き)
 とともに参照してください。
</P>

<H3>pod とは</H3>

<P>
 pod とは、
 perl スクリプトのドキュメントを記述するためのドキュメント形式です。
 以下のような特色を持っています。
</P>

<UL>
 <LI>単体のドキュメント (.podファイル) としても使えるが、
  perlスクリプトに埋めこむこともできる。

 <LI>簡潔で書きやすいフォーマット

 <LI>man 形式, html 形式への変換ツールがある
</UL>

<P>
 roff, html, latex などの他のマークアップ言語と比較すると、
 機能は非常に限定されていますが、
 ソーステキストが読みやすく書きやすいことが特色です。
 通常のマークアップ言語は、
 生成されたドキュメントを指定のビューアで見た場合は
 (当然ながら) 読みやすいのですが、
 ソースとなるテキストファイルは読むのが困難です。
</P>

<P>
 pod のソースは、通常のテキストファイルと大きな隔たりがなく、
 ソースのままでもある程度読めることが特色です。
 そのため、書く側への負担が小さく、気軽に書けるフォーマットであると言えます。
</P>

<P>
 同様の目的のフォーマットとして Ruby 言語のスクリプトでよく使われる、
 RD というフォーマットもあります。
</P>

<H2>pod マニュアルをJM向けに翻訳する場合の作業方法</H2>

<H3>リポジトリ内でのディレクトリ構成</H3>

<P>
 JM のリポジトリ内でのディレクトリ構成は以下のようになります。
 (zebedeeというプログラムの場合)
</P>
<PRE>
  JM -+- pod -+- zebedee -+- ChangeLog
			  +- translation_list
			  +- original -+- zebedee.pod
			  |            +- ftpgw.tcl.pod 
 			  |
 			  +- draft    -+- zebedee.pod
			  |            +- ftpgw.tcl.pod 
 			  |
			  +- release  -+- zebedee.pod
			               +- ftpgw.tcl.pod
</PRE>

<P>
 すなわち、通常のroff形式のマニュアルと次の点が違います。
</P>
<UL>
<LI>トップディレクトリがJM/manualでなくJM/pod
<LI>man1,man3のようなセクション別のサブディレクトリがない
</UL>

<P>
 podの下がプログラム名になり、その下が
 original/draft/releaseになることと、
 この 3 つのディレクトリの使用法はroff形式の場合と同じで、次のとおりです。
</P>

<DL>
 <DT>original<DD>オリジナルのソース
 <DT>draft<DD>翻訳作業中の日本語ソース(コメントとして原文を含む)
 <DT>release<DD>翻訳が完了した日本語ソース
</DL>

<H3>translation_list の書式</H3>
<P>
 translation_list は以下のようになります。
</P>

<PRE>
△:zebedee:2.0.0:2000/05/30:zebedee:pod:2000/6/21:(G):tnaka@brain-tokyo.com:NAKAJIMA Taku:::
×:zebedee:2.0.0:2000/05/30:ftpgw.tcl:pod:::::::
</PRE>

<P>
 すなわち、セクション名(6番目のフィールド)が"pod"になります。
 それ以外は、roff形式のマニュアルと同じです。
</P>

<H3><A NAME="comment-format">原文のコメント化</A></H3>
<P>
 JMでは、draft文書については、
 校正者の便宜のために原文をコメントで残すことが推奨されています。
 pod ドキュメントの一般的なコメントの形式は =begin/=end ですが、
 原文をコメント化した部分と通常のコメントを区別するため、
 以下のような"JM-comment"というタグ付きのコメントを使用してください。
</P>

<PRE>
=begin JM-comment

If a key is described as being a boolean then its value must be one of the
words B<true> or B<false>.

=end JM-comment

キーワードが真偽値(boolean)と書かれていたら、
その値は"B<true>" または "B<false>"でなければならない。
</PRE>
<P>
 このようにしておくと、htmlやmanに変換した時に原文は削除されます。
 また、
 _LINK(#remove-comment,以下)
 に述べるように簡単なコマンドでソースから原文を取り除くこともできます。
</P>

<H3>ポストの方法</H3>
<P>
 JMでは、JM メーリングリストに特定の形式で投稿することで
 CVS リポジトリに commit する方法が用意されていますが、
 現状ではpodマニュアルの場合はこの方法は使用できません。
</P>
<P>
 そのため、pod の翻訳作業を投稿するためには、
 CVS のアカウントをもらって CVS committer になるか、
 CVS committer に依頼する必要があります。
</P>
<P>
 作業にあたっては、ポストの方法について
 JM のメーリングリストでご相談下さい。
</P>

<H2>pod マニュアル翻訳上の注意、TIPS</H2>

<H3>翻訳確認の方法</H3>

<P>
 作業結果の確認のためには、以下のコマンドを使います。
</P>

<P CLASS="noindent">
<STRONG>html変換してから表示</STRONG>
</P>
<PRE>
$ pod2html podソース名 > 作業用htmlファイル名
$ netscape 作業用htmlファイル名
</PRE>

<P CLASS="noindent">
<STRONG>man変換してから表示</STRONG>
</P>
<PRE>
$ mkdir man1
$ pod2man  podソース名 > man1/xxxxxx.1
$ man -M . xxxxxx
</PRE>

<P>
 pod はドキュメントフォーマットの細部が確立してないためか、
 pod2html と pod2man で違う結果となる (片方だけでエラーが出る)
 ことがたまにありますから、
 常に両方の結果を確認した方がいいと思います。
</P>

<P>
 また、どちらのコマンドもparagraph単位(段落)のエラー表示で、
 エラーの行番号が表示されないし、
 エラーメッセージもわかりやすいとは言えません。
 そのため、こきざみに変換コマンドを実行した方がいいと思います。
 たくさんの作業を一度にしてからエラーを出すと、原因をつきとめるのが困難です。
</P>

<H3>段落名の翻訳の注意点</H3>

<P>
 pod2manは、変換元のpodドキュメントが
 以下の条件を満たしていることを前提としているようです。
</P>

<OL>
 <LI>最初の段落が"=head1 NAME"から初まること
 <LI>"=head1 DESCRIPTION"という段落が存在すること
 <LI>=head1 =head2以外の見出しを使わない
</OL>

<P CLASS="noindent">
 そのため、=head...の翻訳には注意を要します。
</P>

<P>
 pod2html には段落への
 HTMLリンクタグを自動生成する機能があるのですが、
 pod ドキュメントがこれを使用している場合は、
 段落名を翻訳してしまうと、このリンクが正しく張れなくなります。
</P>

<P>
 このため、段落名の翻訳は非常に注意が必要です。
 この問題に対する一般的な対応方法はまだ決定していません。
 現状では、段落名は原文のままにしておいて、
 個別に JM メーリングリストで対応方法を相談してください。
</P>

<H3><A NAME="remove-comment">原文の削除</A></H3>
<P>
 _LINK(#comment-format,先に述べたような形式)
 で原文を保持している場合、
 この原文を削除するには、次のようなコマンドを使用します。
</P>
<PRE>
perl -n -e 'print unless /^=begin\s*JM-comment/../^=end\s*JM-comment/' zebedee.pod > ../release/zebedee.pod
</PRE>

_CREDITS

 <P>
  <IMG SRC="../images/grey.png" WIDTH="14" ALT="* " HEIGHT="14">
  _LINK(index.html,JM 翻訳作業の手引きに戻る)
 </P>

_BACK_TO_HOME

</BODY>
</HTML>
