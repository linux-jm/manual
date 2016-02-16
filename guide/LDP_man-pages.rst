========================
LDP man-pages 翻訳ガイド
========================

.. _ldp_preparation:

準備
====

LDP man-pages のマニュアルのレポジトリは git の submodule になっています。
作業時は以下のように submodule を展開します。

.. code-block:: console

   git://scm.osdn.jp/gitroot/linuxjm/jm.git
   cd jm
   git submodule update --init --recursive

また、po4a を利用しているので、インストールしておきます。

.. code-block:: console

   apt-get install po4a

翻訳方法
========

LDP man-pages では、翻訳に po4a を利用しています。

roff ファイルと po4a ファイルの変換には、LDP man-pages のフランス語翻訳チームが
公開している perkamon を利用しています。
perkamon を git submodule として利用しているため、手順が少し複雑になっています。

前準備
------

git repository の top directory で以下のコマンドを実行します。

.. code-block:: console

   cd $JM_REPO_TOP
   git submodule update --init

po4a 環境を用意します。

.. code-block:: console

   cd manual/LDP_man-pages
   make jm-setup

これで po4a で作業して draft に反映する準備が整いました。

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

   make
   make translate

初めて実行する際には、全ての ja.po が変換対象になるので、時間がかかります。
どのファイルが更新されたかは git status で確認して下さい。

.. code-block:: console

   git status .

デフォルトでは、翻訳率 80% 以上のページが生成されます。
80% にしている理由は、ある程度日本語混じりの draft page を見ながら翻訳する方が
全体の文脈をつかみやすいためです。全部翻訳できたかは、下記の「翻訳状況の確認」
の方法で確認できるので、翻訳率 100% を閾値にする必要はないと考えています。

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

リリース
--------

まとめてリリースを行う場合の手順です。
通常は JM ML でレビューを行います。

``make release`` を実行すると、以下を行います。

* draft page を release フォルダにコピー
* translation_list を更新し、 PO ファイルで翻訳率が 100% になっているページのステータスを「☆」
  リリース済に変更します。

更新後は通常のリリース手順と同じです。

* release ファイルを git add -u → git commit
* (必要に応じて) www/index.m4, www/news/index.m4 を更新
