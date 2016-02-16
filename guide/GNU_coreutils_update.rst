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

(4) help2man.ja の更新
----------------------

help2man.orig 側でのファイルの add/update/remove を反映する。

``original/man1/*.1`` が更新されるのは、以下の二つのケースがある。

* ``*.x`` が更新された場合
* help message が更新された場合

  * ``SOURCE/po/ja.po`` を修正して Translation Project へ。
