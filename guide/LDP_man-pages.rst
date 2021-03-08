========================
LDP man-pages 翻訳ガイド
========================

LDP man-pages では、翻訳に po4a を利用しています。
そのため、手順が他の翻訳方法と少し異なっています。

.. _ldp_preparation:

準備
====

po4a を利用しているので、インストールしておきます。
以下は Debian/Ubuntu の場合。
他のディストリビューションの場合も po4a をインストールすれば大丈夫だと思います。

.. code-block:: console

   $ apt-get install po4a

翻訳更新の動作確認を行っておきます。
全ファイルを処理するので多少時間がかかります (2〜3分くらい)。

.. code-block:: console

   $ cd manual/LDP_man-pages
   $ make jm-setup
   $ make
   $ git status

全部のコマンドがエラーなく終了すること、
最後の ``git status`` コマンドで更新されているファイルがないこと、
を確認してください。
``git status`` の出力で更新されているファイルがある場合は、
そのまま翻訳作業を進めると、意図しないファイルも更新してしまうことがあるので、
メーリングリストで相談するなどして対応を検討しましょう。
作業漏れ以外の可能性もあり、たとえば、 po4a のバージョンが変わって
PO ファイルへの抜き出し方法が変わることもあります。

翻訳方法
========

LDP man-pages では、翻訳に po4a を利用しています。

roff ファイルと PO ファイルの変換には、 roff ファイルと PO ファイルが 1:1
になっているわけではなく、 po4a ファイルはカテゴリー毎に用意され、
ひとつの po4a ファイルには複数の roff ファイルが含まれています。

おおまかな流れは以下のようになります。

1. 翻訳したい man page に対応する PO ファイルを特定する
2. PO ファイルで翻訳を行う
3. draft の man page を生成する

ファイルの対応付けがこのようになっているのは、
似た roff ファイルには似た文が含まれていてカテゴリー単位の方が翻訳が
効率化されること、逆に全 roff ファイルを一つの PO ファイルにまとめて
しまうと本来違う意味で解釈すべき文が同じエントリーになってしまう可能性
があり、それを回避するため、という点からです。
この対応付けは、もともと LDP man-pages のフランス語翻訳チームが
公開していた perkamon をベースにしています。

翻訳と draft への変換
---------------------

ja.po と man page の関係
~~~~~~~~~~~~~~~~~~~~~~~~

一つの po ファイルは、 LDP\_man-pages の複数の man page に対応しています。
man page に対応する po ファイルを特定するには、以下のコマンドを実行します。

.. code-block:: console

   $ ./tools/identify-po.sh strptime.3
   strptime.3 -> po4a/time/po/ja.po

上記の場合、strptime.3 が含まれる po ファイル (ja.po) は time 以下にあります。
po4a/time/po/ja.po を翻訳することになります。

翻訳
~~~~

上記で特定した ja.po を翻訳します。

エディタは po ファイルに対応しているものが便利です。

* Emacs を使っていれば Emacs の po-mode が便利です。
* gedit も PO ファイルをきれいに色付けしてくれるので、作業しやすいと思います。

draft page の生成
~~~~~~~~~~~~~~~~~

ja.po から draft を生成するには以下のいずれかを実行します (どちらも同じです)。
更新を行った PO ファイルのみが変換されます。

.. code-block:: console

   $ make

または

.. code-block:: console

   $ make translate

どのファイルが更新されたかは git status で確認して下さい。

.. code-block:: console

   $ git status .

デフォルトでは、翻訳率 80% 以上のページが生成されます。
80% にしている理由は、ある程度日本語混じりの draft page を見ながら翻訳する方が
全体の文脈をつかみやすいためです。全部翻訳できたかは、下記の「翻訳状況の確認」
の方法で確認できるので、翻訳率 100% を閾値にする必要はないと考えています。

生成された draft page を man コマンドで整形して、内容を確認します。
修正を行う際は、 ja.po を更新 -> draft page の生成 -> 内容の確認、を繰り返します。

.. code-block:: console

   $ man -l draft/man3/strptime.3

翻訳状況の確認
--------------

ページ毎の翻訳状況
~~~~~~~~~~~~~~~~~~

上記の draft page の生成の際に、翻訳状況のページ untrans.html が更新されます。
このページを表示すると、ページ毎の翻訳状況が確認できます。

.. code-block:: console

   w3m untrans.html

PO ファイル単位の翻訳状況
~~~~~~~~~~~~~~~~~~~~~~~~~

PO ファイル毎の翻訳状況も表示できます。

.. code-block:: console

   make postats

未翻訳項目がある PO ファイルのみを表示することもできます。

.. code-block:: console

   make untrans-postats

レビュー
--------

JM ML に翻訳を投稿する場合は、以下のファイルを投稿して下さい。

* ja.po から生成された draft page
* 翻訳した ja.po ファイルの git diff
  (または ja.po ファイルそのもの)

ja.po の diff は以下のコマンドで取得できます。 time の ja.po を翻訳した場合。

.. code-block:: console

   git diff po4a/time/po/ja.po

.. note::

   レビュー方法は改善の余地がいろいろあると思います。
   たとえば、プルリクエストを使うなど。

リリース
--------

まとめてリリースを行う場合の手順です。
通常は JM ML でレビューを行います。

``make release`` を実行すると、以下を行います。

* draft page を release フォルダにコピー
* translation_list を更新し、 PO ファイルで翻訳率が 100% になっているページのステータスを「☆」
  リリース済に変更します。

更新後は通常のリリース手順と同じです。

* release ファイルを git add → git commit
* (必要に応じて) www/index.m4, www/news/index.m4 を更新
