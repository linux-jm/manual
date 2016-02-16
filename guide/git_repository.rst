================
リポジトリの構成
================

JM Project では、git によって文書の管理をしています。
このページでは、 リポジトリ内部の配置について説明します。

各 man ページの作業情報などは、テキストデータベース transalation_list で管理しています。
このファイルの書式は :doc:`translation_list` を参照してください。

ディレクトリ構成
================

JM Project の用いている git リポジトリのディレクトリ構成は 以下のようになっています。

.. code-block:: none

   .
   ├── admin
   ├── bin
   ├── dist
   │   └── script
   ├── manual
   │   ├── acl
   │   │   ├── draft
   │   │   ├── original
   │   │   ├── po4a
   │   │   └── release
   │   ├── apmd
   │   │   ├── draft
   │   │   ├── original
   │   │   └── release
   │   ├── GNU_bash
   │   │   ├── draft
   │   │   ├── original
   │   │   ├── po4a
   │   │   └── release
   │   ├── GNU_bc
   │   │   ├── contrib
   │   │   └── original
   ├── stamp
   └── www
       ├── announcement
       ├── bin
       ├── images
       ├── INDEX
       ├── man-ja
       ├── news
       └── rpm

このうちの manual/ 以下が、本サイトの
`manual ディレクトリ <http://linuxjm.osdn.jp/manual/>`_
以下にミラーされています。
このディレクトリには、 マニュアルの一次ソースとなるアーカイブパッケージ (例えば ``util-linux-2.9v.tar.gz`` など)
の ``basename`` と同名のサブディレクトリ (``util-linux``) を設けます。
ただし GNU のパッケージと LDP のパッケージだけには、 便宜上 ``GNU_``, ``LDP_`` という prefix をつけています。
このサブディレクトリを、以下では 「パッケージディレクトリ」と呼びます。

パッケージディレクトリ内の構造
==============================

各パッケージディレクトリのサブ構造は以下のようになっています。

現在 JM のマニュアル管理は、 po4a を使用している場合としていない場合が混在しています。

po4a 未使用時
-------------

.. code-block:: none

   pkg
   ├── ChangeLog
   ├── translation_list
   ├── contrib
   │   └── man1
   ├── draft
   │   ├── man1
   │   ├── man5
   │   └── man8
   ├── obsolete
   │   ├── man1
   │   ├── man6
   │   └── man8
   ├── original
   │   ├── man1
   │   ├── man5
   │   └── man8
   └── release
       ├── man1
       ├── man5
       └── man8

* ChangeLog : 変更履歴を記述したファイルでしたが、現在はほとんど使われていません。変更履歴は Git にて管理されています。
* translation_list は各マニュアルページのバージョンや作業情報、 著作権情報等を含むテキストデータベースファイルです。
  このファイルの書式については :doc:`translation_list` で説明します。
* ディレクトリ original/ には、 パッケージに含まれている原文が置かれます。
* ディレクトリ draft/ には、 「原文のコメントつき」の翻訳版が置かれます。 ここに置かれるページは、ドラフト版・リリース版を問わず、 常に翻訳作業の最新版になります。
* ディレクトリ release/ には、 「原文を取り去ったリリース版」が置かれます。
* ディレクトリ contrib/ には、 JM 以外で翻訳されたページの寄贈を受けた場合に、 そのファイルが置かれます。

実作業との対応は :doc:`translation_procedure` を参考にしてください。

po4a 使用時
-----------

.. code-block:: none

   pkg
   ├── ChangeLog
   ├── translation_list
   ├── Makefile
   ├── draft
   │   ├── man1
   │   └── man8
   ├── original
   │   ├── man1
   │   ├── man3
   │   └── man8
   ├── po4a
   │   ├── add_ja
   │   │   └── copyright
   │   ├── man1
   │   ├── man3
   │   └── man8
   └── release
       └── man8

po4a ディレクトリがある点が大きな違いです。

 * ChangeLog : 変更履歴を記述したファイルでしたが、現在はほとんど使われていません。変更履歴は Git にて管理されています。
 * translation_list は各マニュアルページのバージョンや作業情報、 著作権情報等を含むテキストデータベースファイルです。
   このファイルの書式については :doc:`translation_list` で説明します。
 * ディレクトリ original/ には、 パッケージに含まれている原文が置かれます。
 * ディレクトリ po4a/ には、

   * man[1-8] 以下には、各マニュアルに対応する PO ファイルが置かれます。PO ファイルが翻訳を管理するのに使用されます。
     ここに置かれる PO ファイルはドラフト版・リリース版を問わず、常に翻訳作業の最新版になります。
   * add_ja/copyright ディレクトリには、各マニュアルに対応する著作権ファイルを記載したファイルが置かれます。
     po4a を用いて、翻訳版マニュアルを生成する際に挿入されます。

 * ディレクトリ draft/ には、po4a を用いて PO ファイルから生成された翻訳版マニュアルが置かれます。
    po4a を使用している場合には、原文のコメントは含まれません。
    基本的には、常に po4a/  以下にある PO ファイルの内容と同期されています。
 * ディレクトリ release/ には、リリース版のマニュアルが置かれます。
   po4a を使用している場合、リリース時点では、リリース版のページはドラフト版のページと内容は同じになります。

なお、po4a を使用している場合には、contrib ディレクトリは設けられていません。
JM 以外で翻訳されたページの寄贈を受けたことは、
``translation_list`` のステータスと ``po4a/add_ja/copyright`` 内のファイルに記録されます。
