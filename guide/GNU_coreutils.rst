========================
GNU coreutils 翻訳ガイド
========================

.. _coreutils_preparation:

準備
====

GNU coreutils のマニュアルのレポジトリは git の submodule になっている。
作業時は以下のように submodule を展開する。

.. code-block:: console

   git://scm.osdn.jp/gitroot/linuxjm/jm.git
   cd jm
   git submodule update --init --recursive

``help2man`` と ``help2man`` のメッセージカタログをインストールしておく必要がある。
Debian/Ubuntu の場合は ``help2man`` と ``language-pack-ja`` をインストールする。

``GNU_coreutils`` のコンパイルも行うので、
基本的な開発ツールもインストールしておく。

.. code-block:: console

   apt-get install build-essential

翻訳の手順
==========

GNU coreutils のマニュアルは ``help2man`` を使って生成しています。
翻訳は以下の 2 つの組み合わせで生成されています。

* GNU coreutils のコマンドの ``--help`` の出力
* ``help2man.ja/*.x`` 以下のファイル

翻訳を始める前に
----------------

``make all`` を実行すると ``GNU coreutils`` のソースが ``source`` 以下に展開され、
man page の自動生成の環境が整います。

.. code-block:: console

   $ cd <JM repo top>
   $ cd manual/GNU_coreutils
   $ make all

補足事項

* 最初は ``coreutils-*.tar.xz`` を取得して、プログラムの生成も行うので、時間がかかります。
* ``make clean`` で ``help2man.ja/*.1`` を削除できます。
* トップディレクトリで ``make install`` を実行すると、
  ``help2man.ja/*.1`` が ``draft/man1`` にコピーされる。

coreutils の ja.po
------------------

コマンドの ``--help`` 出力は GNU coreutils の配布物の ``po/ja.po`` を元に
作成されており、この ``ja.po`` は
`Translation Project <http://translationproject.org/team/ja.html>`_ で
管理されています。

変更が必要な場合は上記で展開された ``source/po/ja.po`` を編集します。
変更後に上記の ``make all`` を実行すると、
``help2man.ja/`` 以下に ``*.1`` が生成されます。

変更を行ったものは基本的に
`Translation Project <http://translationproject.org/team/ja.html>`_
に反映するのが筋だと思います。

help2man.ja/\*.x
----------------

``help2man.ja/\*.x`` は help2man が生成する man page に組み込まれます。

``help2man.ja`` の翻訳では、
原文は roff の場合と同じく ``.\"O`` で始めるものとします。

変更の翻訳への反映方法は ``ja.po`` の場合と同じく
``make html`` を実行します。

翻訳校正 (暫定ルール)
=====================

* ``*.x`` を投稿する。
  original の翻訳者が manpage も投稿してもよい。

* JM git repo に登録時に manpage を committer が生成する。
  mandiff.py などで HTML を生成して、original と翻訳の比較ができるようにする。
  Makefile のルールを追加しておきたい。
