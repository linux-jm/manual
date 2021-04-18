========================
GNU coreutils 翻訳ガイド
========================

.. _coreutils_preparation:

準備
====

``help2man`` と ``help2man`` のメッセージカタログをインストールしておく必要がある。
Debian/Ubuntu の場合は ``help2man`` と ``language-pack-ja`` をインストールする。

``GNU_coreutils`` のコンパイルも行うので、
基本的な開発ツールもインストールしておく。

.. code-block:: console

   apt-get install build-essential

翻訳の手順
==========

GNU coreutils のマニュアルは ``help2man`` を使って生成されています。
翻訳は以下の 2 つの組み合わせで生成されています。

* GNU coreutils のコマンドの ``--help`` の出力
* ``help2man.ja/*.x`` 以下のファイル

翻訳を始める前に
----------------

``make`` を実行すると ``GNU coreutils`` のソースが ``source`` 以下に展開され、
man page の自動生成の環境が整います。

.. code-block:: console

   $ cd <JM repo top>
   $ cd manual/GNU_coreutils
   $ make

補足事項

* 最初は ``coreutils-*.tar.xz`` を取得して、プログラムの生成も行うので、時間がかかります。
* ``make clean`` で ``help2man.ja/*.1`` を削除できます。
* トップディレクトリで ``make install`` を実行すると、
  ``help2man.ja/*.1`` が ``draft/man1`` にコピーされる。

翻訳作業
--------

``source/po/ja.po`` と ``help2man.ja/*.x`` を編集して翻訳を行います。
ファイルの詳細は :ref:`下記 <coreutils-files>` を参照のこと。

これらのファイルに変更を加えた場合、 ``make`` を実行すると、
対応するページが ``help2man.ja/*.1`` に生成されます。
生成されたファイルを確認しながら、翻訳作業を繰り返します。

翻訳校正
--------

.. warning::

   暫定ルールです。方法が定まってきたらここに反映しましょう。

以下をメーリングリストに投稿します。

* 生成された manpage
* 対応する ``*.x`` ファイル
* coreutils の ``ja.po`` を変更した場合は ``ja.po`` の差分

.. _coreutils-files:

ファイルの説明
==============

coreutils の ja.po
------------------

コマンドの ``--help`` 出力は GNU coreutils の配布物の ``po/ja.po`` を元に
作成されており、この ``ja.po`` は
`Translation Project <http://translationproject.org/team/ja.html>`_ で
管理されています。

変更が必要な場合は上記で展開された ``source/po/ja.po`` を編集します。
変更後に上記の ``make`` を実行すると、
``help2man.ja/`` 以下に ``*.1`` が生成されます。

変更を行った場合は、編集した ``source/po/ja.po`` を
``ja.po/ja.po.<VERSION>`` にコピーしておきます。
すでに ``ja.po/ja.po.<VERSION>`` が存在している場合は、
「翻訳を始める前に」の ``make`` の中で、
``source/po/ja.po`` は ``ja.po/ja.po.<VERSION>`` へのシンボリックリンク
になっているため、上記のコピーは不要です。

.. note::

   なお、 ``ja.po`` に変更を行った場合は、基本的に
   `Translation Project <http://translationproject.org/team/ja.html>`_
   に反映するのが筋だと思います。これにより、次回以降の GNU coreutils
   のリリースに変更が反映されます。
   ただし、今のリリースバージョンへの反映はできないため、
   JM リポジトリで ``ja.po/ja.po.<VERSION>`` を管理するのは
   一定程度意味があると思われる。

help2man.ja/\*.x
----------------

``help2man.ja/\*.x`` は help2man が生成する man page に組み込まれます。

``help2man.ja`` の翻訳では、
原文は roff の場合と同じく ``.\"O`` でコメントアウトするものとします。

すでにファイルがある場合は、
``help2man.orig`` 内の対応するファイルの内容が ``help2man.ja`` の方にも
反映されているかを確認すること。

