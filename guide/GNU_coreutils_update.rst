========================
GNU coreutils 管理ガイド
========================

.. _coreutils_original_update:

準備
====

:ref:`翻訳ガイド <coreutils_preparation>` を参照してください。


原文の更新
==========

(1) Makefile のバージョン更新
------------------------------

Makefile の V = <version> を更新するバージョンに変更する。

.. code-block::
   :caption: Makefile

   V = 8.32

以前のバージョンの coreutils に対するパッチ
``patch-$(VERSION).diff`` の内容を確認し、
不要な場合は以前のパッチファイルを削除する。
バージョン更新後も必要な場合や新たにパッチが必要な場合は、
新しいバージョン番号で ``patch-$(VERSION).diff`` を作成
(or ファイル名変更) する。

その後、以下のコマンドを実行し、

.. code-block:: console

   $ make clean-setup
   $ make source

(2) ファイルのコピー
--------------------

.. code-block:: console

   $ rm -f original/man1/* help2man.orig/*
   $ cp -p source/man/*.1 original/man1/
   $ cp -p source/man/*.x help2man.orig/

(3) translation_list の更新
---------------------------

原文の変更に関して git で add/remove を行う。

.. code-block:: console

   $ git add original help2man.orig
   $ git status original > git.txt

   (必要であれば下記の警告にあるように空行の追加を行う)

   $ ../../admin/git2upd < git.txt > upd.txt

   (edit upd.txt; 通常は更新日付の手動修正と不要な行の削除くらい)

   $ ../../admin/upd_tl.perl translation_list upd.txt <VERSION>
   $ mv translation_list.<VERSION> translation_list

.. warning::

   git のバージョンによっては ``git2upd`` が期待通り動作しない場合がある。
   :doc:`upstream_update` の ``git2upd`` に関する注意を参照し、
   必要な場合は ``git status`` の出力を加工すること。

(4) マニュアル生成の動作確認
----------------------------

念のため、新しいバージョンの coreutils で help2man でのマニュアル生成が
正常に行われることを確認する。

.. code-block:: console

   $ make build-man

上記を実行すると ``help2man.ja`` ディレクトリに ``*.1`` ファイルが
生成される。適当に数個生成された ``*.1`` ファイルを確認する。
原文が更新されていることがあるので、英語が残っている点に
ついては気にしなくてよい。

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
