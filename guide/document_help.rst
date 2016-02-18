====================
ドキュメント編集メモ
====================

このドキュメントは Sphyinx を使って作成しています。
ReST 記法が利用できるので、お手軽、かつ多様な表現が可能です。

格納場所
========

ドキュメントのソースは git repository の ``guide/`` ディレクトリに
あります。

ドキュメント build 方法
=======================

build 環境の準備
----------------

自分の環境でドキュメントの build を確認するには sphinx をインストールする
必要があります。

.. code-block:: console

   $ pip install -r requirements.txt

上記のコマンドを有効にすると、
sphinx と sphinx-bootstrap-theme がインストールされます。

build 方法
----------

.. code-block:: console

   $ cd <JM_GIT_REPO_TOP>/guide
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
