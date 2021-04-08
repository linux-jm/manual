====================
ドキュメント編集メモ
====================

このドキュメントは Sphinx を使って作成しています。
ReST 記法が利用できるので、お手軽、かつ多様な表現が可能です。

格納場所
========

ドキュメントのソースは、JM リポジトリの ``guide`` ディレクトリにあります。
リポジトリの取得は :doc:`こちら <basic_info>` を参照。

ドキュメントの build 方法
=========================

ドキュメントを編集する際は、 JM リポジトリの ``guide`` ディレクトリで
作業してください。

build 環境の準備
----------------

自分の環境でドキュメントの build を確認するには sphinx をインストールする
必要があります。

python の pip コマンドを使う場合は以下を実行します。
``sphinx`` がインストールされます。

.. code-block:: console

   $ pip install -r requirements.txt

ディストリビューションが提供するパッケージを利用することもできます。
openSUSE の場合は、zypper コマンドで ``python3-sphinx`` をインストールします。
Debian/Ubuntu の場合は ``python3-sphinx`` をインストールします。

build 方法
----------

ドキュメントが置かれている ``guide`` ディレクトリに移動した上で、
必要なドキュメントを編集した上で、 ``make`` でドキュメントを作成します。

.. code-block:: console

   $ make html

出来上がった HTML ファイルは ``_build/html`` に格納されます。

作成されたドキュメントを破棄して作り直すには以下のようにします。

.. code-block:: console

   $ make clean
   $ make html

参考情報
========

* `reStructuredText入門 <http://docs.sphinx-users.jp/rest.html#lists-and-quote-like-blocks>`_
* `インラインマークアップ <http://docs.sphinx-users.jp/markup/inline.html>`_
* `Sphinxドキュメント <http://docs.sphinx-users.jp/contents.html>`_
