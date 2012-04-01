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
_EDIT_WARNING(mailformat)
_HEADER(`作業メールのフォーマット')

<P>
 _LINK(repository.html,JM 文書の管理方法)
 に述べたように、 JM では翻訳作業対象の man ページを
 git リポジトリとテキストデータベースによって管理しています。
</P>

<P>
 こちらへの登録を省力化・自動化するために、
 ML に翻訳を post する際にはこのページに記述されたような
 フォーマットにすることが推奨されます。
 (sourceforge 以降後は自動登録は行っていませんが、
 登録作業の省略化のため、このフォーマットの使用をお願いします。)
</P>

<P>
 投稿を省力化するために、 bash の使える環境の方は
 _LINK(#JMpost,JMpost スクリプト)
 を使っていただくといいでしょう。
 また、Wanderlust や Mew のユーザの場合には、JMpost 形式のメールを作成してくれる
 _LINK(JMpost-wl.el,JMpost-wl.el) や
 _LINK(JMpost-mew.el,JMpost-mew.el)
 も用意されていますので、お試し下さい。
</P>

 
<H2><A NAME="format">メールのフォーマット</A></H2>
<H3>送信先</H3>
<P>
 送信先アドレスは
</P>

<BLOCKQUOTE><STRONG>
linuxjm-discuss@lists.sourceforge.jp
</STRONG></BLOCKQUOTE>

<P CLASS="noindent">
 としてください。
m4_dnl これは実際には JM@linux.or.jp へのエイリアスで、
m4_dnl JM ML のメンバに通常のポストと全く同じように届きます。
m4_dnl 送信先アドレスを変えるのは、自動処理のためです。
</P>

<H3>サブジェクト</H3>
<P>
 メールヘッダの Subject 行は
</P>

<BLOCKQUOTE>
Subject: [POST:XX] (package 名) (page ファイル名)
</BLOCKQUOTE>

<P CLASS="noindent">
 のようにしてください。
 XX のところには、後述する
 <A HREF="#stat">stat</A> を書いてください。
 (例: [POST:TR] LDP man-pages strcmp.3)。
</P>

<H3>ヘッダ</H3>
<P>
 メールの本文の先頭に、ページの情報を記述したヘッダを置いてください。
 &lt;STATUS&gt;, &lt;/STATUS&gt; に挟まれた部分がヘッダ情報になります。
 ヘッダ情報は 1 行 1 レコードからなり、
 区切りは ": " (コロンとスペース) です。
 必要なレコードは以下の 6 つです。
</P>

<DL>
 <DT><A NAME="stat"><STRONG>stat</STRONG></A></DT>
 <DD>
  ページのステータスです。
  ("TR", "DO", "DP", "PR", "RO", "RR") のどれか一つを
  指定します。それぞれの意味は以下のようになります。
  <UL>
   <LI>TR: 翻訳の予約。 (Translation Reservation)
   <LI>DO: ドラフトの投稿。自分では校正を行わない。
    (Draft Only)
   <LI>DP: ドラフトの投稿。引き続き自分で校正を行う。
    (Draft and Proof reservation)
   <LI>PR: 校正待ち状態のドラフトに対する校正作業の予約。
    (Proof Reservation)
   <LI>RO: リリースの投稿。原文更新時の予約はしない。
    (Release Only)
   <LI>RR: リリースの投稿です。原文更新時の改訂作業を予約する。
    (Release and update Reservation)
  </UL>

 <DT><STRONG>ppkg</STRONG></DT>
 <DD>この man ページが含まれるパッケージの名前</DD>

 <DT><STRONG>page</STRONG></DT>
 <DD>ページのファイル名</DD>

 <DT><STRONG>date</STRONG></DT>
 <DD>_LINK(repository.html#translation_list,translation_list)
  データベースに記録される日付</DD>

 <DT><STRONG>mail</STRONG></DT>
 <DD>投稿者のメールアドレス</DD>

 <DT><STRONG>name</STRONG></DT>
 <DD>投稿者の Real Name (ローマ字表記が望ましい)</DD>
</DL>

<P>
 例えば翻訳作業の予約の場合は、以下のようになります。
</P>

<PRE>
&lt;STATUS&gt;
stat: TR
ppkg: GNU sharutils
page: shar.1
date: 1999/10/04
mail: nakano@apm.seikei.ac.jp
name: NAKANO Takeo
&lt;/STATUS&gt;
</PRE>

<H3>本文</H3>
<P>
 ヘッダの後、 man ページの本文を置いてください。
 ヘッダ以降に最初に現れた「空行以外の行」から、
 メールの末尾までが man ページとして登録されます。
 従って signature 等は置かないようにしてください。
</P>

<P>
 man ページ自体の書式や、記述に関する注意などは
 _LINK(translation_note.html,翻訳の指針)
 を参考にしてください。
</P>

<H2><A NAME="JMpost">JMpost コマンド</A></H2>
<P>
 以上のフォーマットのメール送信を簡単に行うため、
 bash のシェルスクリプト
 _LINK(JMpost,JMpost)
 を用意しました。
 以下に使い方を説明します。
</P>

<H3>コマンドライン</H3>
<PRE>
        JMpost [-S stat] [-P pkg] [-F page] [-D date]
          [-M mail] [-R name] [filename] [-post]
</PRE>

<H3>使い方</H3>
<P>
 予約・作業ページの登録ともに用います。
 作業したファイルを CVS リポジトリに登録する場合
 (-S オプションの DO, DP, RO, RR に対応) は、
 そのファイルをコマンドラインに指定します。
</P>

<P>
 オプションは全て省略可能ですが、
 必要に応じて質問のプロンプトが出されます。
 プロンプトは標準エラー出力に出され、
 標準入力から回答を受付けます。
</P>

<P>
 コマンドラインの最後に -post オプションをつけると、
 結果は /usr/lib/sendmail を用いて JM-ML にポストされます。
 -post オプションをつけない場合は、
 ML に流される内容が標準出力に書き出されます。
</P>

<H3>オプション</H3>

<DL>
 <DT><A NAME="status"><STRONG>-S</STRONG></A></DT>
 <DD>
  文書のステータスを記述します。有効なものは以下のどれかです。
  <UL>
   <LI>TR: 翻訳の予約です。 (Translation Reservation)
   <LI>DO: ドラフトの投稿です。自分では校正を行わない場合です。
    (Draft Only)
   <LI>DP: ドラフトの投稿です。引き続き自分で校正を行う場合です。
    (Draft and Proof reservation)
   <LI>PR: 校正待ち状態のドラフトに対する校正作業の予約です。
    (Proof Reservation)
   <LI>RO: リリースの投稿です。原文更新時の予約はしない場合です。
    (Release Only)
   <LI>RR: リリースの投稿です。原文更新時の改訂作業の予約を含みます。
    (Release and update Reservation)
  </UL>
  メールに翻訳原稿が添付されるのは
  DO, DP, RO, RR のいずれかの場合になります。
  _LINK(repository.html#translation_list,translation_list の書式)
  も参考にすると良いでしょう。
 </DD>

 <DT><STRONG>-P</STRONG></DT>
 <DD>
  パッケージの名前です。(例: util-linux, "GNU bash")
 </DD>

 <DT><STRONG>-F</STRONG></DT>
 <DD>
  ページの名前です。 (例: mount.8, bash.1)
 </DD>
 <DT><STRONG>-D</STRONG></DT>
 <DD>
  日付です。省略すると date コマンドの結果が用いられます。
 </DD>
 <DT><STRONG>-M</STRONG></DT>
 <DD>
  作業者のメールアドレスです。
 </DD>
 <DT><STRONG>-R</STRONG></DT>
 <DD>
  作業者の Real Name です。
 </DD>
</DL>

<H3>ノート</H3>
<P>
 スクリプトの先頭部分にある <CODE>name</CODE> および
 <CODE>mail</CODE> 変数を適宜設定しておくと、
 -M オプションや -P オプションの指定を省略できます。
</P>

<H3>例</H3>
<P>
 LDP man-pages パッケージにある
 printf.3 に関する例を示します。
 -M オプションと -R オプションは省略します。
</P>

<H4>翻訳を予約する場合</H4>
<PRE>
        % JMpost -S TR -P "LDP man-pages" -F printf.3 -post
</PRE>

<H4>ドラフトを投稿する場合</H4>
<P>
 翻訳されたファイルは printf.3.draft
 に記述されているものとします。
</P>
<PRE>
        % JMpost -S DP -P "LDP man-pages" -F printf.3 printf.3.draft -post
</PRE>
<P CLASS="noindent">
 これは引き続き自分で校正を行う場合です。
 校正を他の人に任せる場合は -S DO とします。
</P>

<H4>リリース版を投稿する場合</H4>
<P>
 翻訳されたファイルは同じく printf.3.draft
 に記述されているものとします。
 なお、このとき原文のコメント (.\"O..) を
 自分で削除する必要は<STRONG>ありません</STRONG>。
 登録システムが自動的に strip します。
</P>
<PRE>
        % JMpost -S RO -P "LDP man-pages" -F printf.3 printf.3.draft -post
</PRE>
<P CLASS="noindent">
 "-S RR" で投稿すると、次に printf.3 のオリジナルが update 
 されたとき、投稿者に翻訳予約が自動的に割り当てられます。
</P>

_CREDITS

 <P>
  <IMG SRC="../images/grey.png" WIDTH="14" ALT="* " HEIGHT="14">
  _LINK(index.html,JM 翻訳作業の手引きに戻る)
 </P>

_BACK_TO_HOME

</BODY>
</HTML>

