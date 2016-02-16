====================
ドキュメント編集メモ
====================

このドキュメントは Sphyinx を使って作成しています。
ReST 記法が利用できるので、お手軽、かつ多様な表現が可能です。

ドキュメント build 方法
=======================

.. code-block:: console

   $ make html

作成されたドキュメントを破棄して作り直すには以下のようにします。

.. code-block:: console

   $ make clean
   $ make html

参考情報
========

* `reStructuredText入門 <http://docs.sphinx-users.jp/rest.html#lists-and-quote-like-blocks>`_
* `インラインマークアップ <http://docs.sphinx-users.jp/markup/inline.html>`_
* `Sphinxドキュメント <http://docs.sphinx-users.jp/contents.html>`_
