========
一般情報
========

JM リポジトリ
-------------

JM では、原稿の管理に git リポジトリを使用していますが、マニュアルを翻訳するために
JM の共有リポジトリをローカルにコピーしておく必要は必ずしもありません。
一般の man ページについては、今まで通り、開発元から原文の roff
ファイルを入手し、それを翻訳して、投稿してくだされば十分です
(更新するときの便宜を考えて、翻訳に po4a(7) の使用を推奨していますが)。

しかし、プロジェクトの管理はもちろん、LDP man-pages や GNU_coreutils
のマニュアルの翻訳や管理、それにガイドドキュメントの執筆・編集をするには、
JM のリポジトリをローカルにコピーしておく必要があります。それには、git
コマンドを使って、リポジトリを clone します。

以下のようなコマンドを実行すると、カレントディレクトリの
``jm`` というディレクトリ以下に、 JM のローカルリポジトリが作られます。

.. code-block:: console

    $ git clone https://github.com/linux-jm/manual.git

``git clone`` に指定する URL は、どのプロトコルを使用するかで異なります。
読み出し専用なら git と http が使えます。
読み書き両用には https か ssh を使用します。
具体的な URL は
https://github.com/linux-jm/manual で確認してください。

日本語 man ページの確認
-----------------------

自分が作成した man ページを確認したいときは、
man コマンドを使いますが、単に ``man -l ./sample.1`` などとしただけでは、
日本語の整形が乱れます。

以下のようにすることで、比較的きれいに整形することができます。

.. code-block:: console

   $ (echo .mso ja.tmac; cat ./sample.1) | man -l -

よく使う場合には、以下のようなシェルスクリプトを用意しておくのもよいでしょう。

.. code-block:: console
   :caption: man-ja.sh

   #!/bin/bash
   (echo ".mso ja.tmac"; cat $*) | man -l -

.. code-block:: console

   $ man-ja.sh ./sample.1
