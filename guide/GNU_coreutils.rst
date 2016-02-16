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

翻訳の流れ
==========

``help2man.ja`` 以下の ``*.x`` を訳す。
原文は roff の場合と同じく ``.\"O`` で始めるものとする。

* トップディレクトリで ``make all`` を実行すると ``help2man`` が実行され、
  ``help2man.ja/`` 以下に ``*.1`` が生成される。

  * 最初は ``coreutils-*.tar.xz`` を取得して、プログラムの生成も行うので、時間がかかる。
  * ``make clean`` で ``help2man.ja/*.1`` を削除できる。

* トップディレクトリで ``make install`` を実行すると、
  ``help2man.ja/*.1`` が ``draft/man1`` にコピーされる。

翻訳校正 (暫定ルール)
------------------------

* ``*.x`` を投稿する。
  original の翻訳者が manpage も投稿してもよい。

* JM git repo に登録時に manpage を committer が生成する。
  mandiff.py などで HTML を生成して、original と翻訳の比較ができるようにする。
  Makefile のルールを追加しておきたい。
