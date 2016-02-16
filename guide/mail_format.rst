========================
作業メールのフォーマット
========================

.. note::

   現在はメールフォーマットについてはあまり制約はありません。
   原文がテキストで簡単に取り出せる形式であれば、
   どのような形態で投稿頂いても構いません。

:doc:`git_repository` にあるように、 JM では翻訳作業対象の man ページを
git リポジトリとテキストデータベースによって管理しています。

こちらへの登録を省力化・自動化するために、
ML に翻訳を post する際にはこのページに記述されたような
フォーマットにすることが推奨されます。
(sourceforge 移行後は自動登録は行っていませんが、
登録作業の省略化のため、このフォーマットの使用をお願いします。)

投稿を省力化するために、 bash の使える環境の方は
`JMpost スクリプト <http://git.sourceforge.jp/view?p=linuxjm/jm.git;a=blob_plain;f=admin/JMpost;hb=HEAD>`_
を使っていただくといいでしょう。
また、Wanderlust や Mew のユーザの場合には、JMpost 形式のメールを作成してくれる `JMpost-wl.el <http://git.sourceforge.jp/view?p=linuxjm/jm.git;a=blob_plain;f=admin/JMpost-mew.el;hb=HEAD>`_
や `JMpost-mew.el <http://git.sourceforge.jp/view?p=linuxjm/jm.git;a=blob_plain;f=admin/JMpost-mew.el;hb=HEAD>`_
も用意されていますので、お試し下さい。

メールのフォーマット
====================

送信先
------

送信先アドレスは linuxjm-discuss@lists.sourceforge.jp としてください。

サブジェクト
------------

メールヘッダの Subject 行は::

    Subject: [POST:XX] (package 名) (page ファイル名)

のようにしてください。 XX のところには、後述する '''stat''' を書いてください。::

    [POST:TR] LDP man-pages strcmp.3

ヘッダ
------

メールの本文の先頭に、ページの情報を記述したヘッダを置いてください。
``<STATUS>`` と ``</STATUS>`` に挟まれた部分がヘッダ情報になります。
ヘッダ情報は 1 行 1 レコードからなり、 区切りは ": " (コロンとスペース) です。
必要なレコードは以下の 6 つです。

* ``stat``: ページのステータスです。 ("TR", "DO", "DP", "PR", "RO", "RR") のどれか一つを 指定します。それぞれの意味は以下のようになります。

  * TR: 翻訳の予約。 (Translation Reservation)
  * DO: ドラフトの投稿。自分では校正を行わない。 (Draft Only)
  * DP: ドラフトの投稿。引き続き自分で校正を行う。 (Draft and Proof reservation)
  * PR: 校正待ち状態のドラフトに対する校正作業の予約。 (Proof Reservation)
  * RO: リリースの投稿。原文更新時の予約はしない。 (Release Only)
  * RR: リリースの投稿です。原文更新時の改訂作業を予約する。 (Release and update Reservation)

* ``ppkg`` : この man ページが含まれるパッケージの名前
* ``page`` : ページのファイル名
* ``date`` : translation_list データベースに記録される日付
* ``mail`` : 投稿者のメールアドレス
* ``name`` : 投稿者の Real Name (ローマ字表記が望ましい)

例えば翻訳作業の予約の場合は、以下のようになります。::

    <STATUS>
    stat: TR
    ppkg: GNU sharutils
    page: shar.1
    date: 1999/10/04
    mail: nakano@apm.seikei.ac.jp
    name: NAKANO Takeo
    </STATUS>

本文
----

ヘッダの後、 man ページの本文を置いてください。
ヘッダ以降に最初に現れた「空行以外の行」から、メールの末尾までが man ページとして登録されます。
従って signature 等は置かないようにしてください。

man ページ自体の書式や、記述に関する注意などは :doc:`translation_guideline` を参考にしてください。

JMpost コマンド
===============

以上のフォーマットのメール送信を簡単に行うため、
bash のシェルスクリプト
`JMpost <http://git.sourceforge.jp/view?p=linuxjm/jm.git;a=blob_plain;f=admin/JMpost;hb=HEAD>`_
を用意しました。以下に使い方を説明します。

コマンドライン
--------------

::

    JMpost [-S stat] [-P pkg] [-F page] [-D date] [-M mail] [-R name] [filename] [-post]

使い方
------

予約・作業ページの登録ともに用います。 作業したファイルを CVS リポジトリに登録する場合 (-S オプションの DO, DP, RO, RR に対応) は、 そのファイルをコマンドラインに指定します。

オプションは全て省略可能ですが、 必要に応じて質問のプロンプトが出されます。 プロンプトは標準エラー出力に出され、 標準入力から回答を受付けます。

コマンドラインの最後に -post オプションをつけると、 結果は ``/usr/lib/sendmail`` を用いて JM-ML にポストされます。 -post オプションをつけない場合は、 ML に流される内容が標準出力に書き出されます。

オプション
----------

* ``-S`` : 文書のステータスを記述します。有効なものは以下のどれかです。

  * TR: 翻訳の予約です。 (Translation Reservation)
  * DO: ドラフトの投稿です。自分では校正を行わない場合です。 (Draft Only)
  * DP: ドラフトの投稿です。引き続き自分で校正を行う場合です。 (Draft and Proof reservation)
  * PR: 校正待ち状態のドラフトに対する校正作業の予約です。 (Proof Reservation)
  * RO: リリースの投稿です。原文更新時の予約はしない場合です。 (Release Only)
  * RR: リリースの投稿です。原文更新時の改訂作業の予約を含みます。 (Release and update Reservation)

  メールに翻訳原稿が添付されるのは DO, DP, RO, RR のいずれかの場合になります。 translation_list の書式 も参考にすると良いでしょう。

* ``-P`` : パッケージの名前です。(例: util-linux, "GNU bash")
* ``-F`` : ページの名前です。 (例: mount.8, bash.1)
* ``-D`` : 日付です。省略すると date コマンドの結果が用いられます。
* ``-M`` : 作業者のメールアドレスです。
* ``-R`` : 作業者の Real Name です。

ノート
------

スクリプトの先頭部分にある name および mail 変数を適宜設定しておくと、 -M オプションや -P オプションの指定を省略できます。

例
--

LDP man-pages パッケージにある printf.3 に関する例を示します。 -M オプションと -R オプションは省略します。

翻訳を予約する場合
++++++++++++++++++

.. code-block:: console

   % JMpost -S TR -P "LDP man-pages" -F printf.3 -post

ドラフトを投稿する場合
++++++++++++++++++++++

翻訳されたファイルは printf.3.draft に記述されているものとします。

.. code-block:: console


   % JMpost -S DP -P "LDP man-pages" -F printf.3 printf.3.draft -post

これは引き続き自分で校正を行う場合です。 校正を他の人に任せる場合は -S DO とします。

リリース版を投稿する場合
++++++++++++++++++++++++

翻訳されたファイルは同じく printf.3.draft に記述されているものとします。
なお、このとき原文のコメント (.\"O..) を 自分で削除する必要はありません。
登録システムが自動的に strip します。

.. code-block:: console

   % JMpost -S RO -P "LDP man-pages" -F printf.3 printf.3.draft -post

``-S RR`` で投稿すると、次に printf.3 のオリジナルが update されたとき、投稿者に翻訳予約が自動的に割り当てられます。
