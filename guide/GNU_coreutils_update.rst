========================
GNU coreutils 管理ガイド
========================

.. _coreutils_original_update:

準備
====

:ref:`coreutils_preparation` を参照してください。


原文の更新
==========

(1) Makefile のバージョン更新
------------------------------

* Makefile の V = <version> を更新するバージョンに変更する
* make clean-setup
* make source

(2) ファイルのコピー
--------------------

.. code-block:: console

   rm -f original/man1/* help2man.orig/*
   cp -p source/man/*.1 original/man1/
   cp -p source/man/*.x help2man.orig/

(3) translation_list の更新
---------------------------

git で add/remove を行う。


.. code-block:: console

   git status | ../../admin/git2upd > upd.txt

   (edit upd.txt)

   ../../admin/upd_tl.perl translation_list upd.txt VERSION

.. warning::

   git のバージョンによっては ``git2upd`` が期待通り動作しない場合がある。
   :doc:`upstream_update` の ``git2upd`` に関する注意を参照し、
   必要な場合は ``git status`` の出力を加工すること。

(4) help2man.ja の更新
----------------------

help2man.orig 側でのファイルの add/update/remove を反映する。

``original/man1/*.1`` が更新されるのは、以下の二つのケースがある。

* ``*.x`` が更新された場合
* help message が更新された場合

  * ``SOURCE/po/ja.po`` を修正して Translation Project へ。

独自管理パッチ
==============

GNU coreutils のマニュアルでは、
coreutils のソースを利用してコンパイルして、
``ja.po`` を組み込んで man pages を生成しているため、
場合によっては独自修正を管理する場合がある。

2 つのパッチが Makefile でサポートされています。

* ``patch-$(VERSION).diff`` : coreutils に対するパッチ
* ``ja.po/ja.po.$(VERSION)`` : 変更後の ja.po ファイル。

  * パッチではない点に注意。
  * 翻訳内容をローカル修正した場合にはこのファイルに反映を行う。
  * このファイルが存在する場合は、展開されたソース内の ``source/po/ja.po`` から
    このファイルへの symlink が作成される。
