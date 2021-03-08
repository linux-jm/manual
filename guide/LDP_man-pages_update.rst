.. _ldp_original_update:

========================
LDP man-pages 管理ガイド
========================

準備
====

:ref:`ldp_preparation` を参照してください。

原文の更新方法
==============

手順は以下の通り。

1. perkamon の更新
2. 原文の更新作業
3. 単純な fuzzy の更新

0. 事前準備
-----------

Git レポジトリの LDP_man-pages 以下はきれいな状態にした状態で始めること。

.. code-block:: console

   $ cd manual/LDP_man-pages
   $ make clean-setup
   $ git status

1. perkamon の更新
------------------

このセクションの操作はすべて ``perkamon`` ディレクトリーで行う。
ここでは、新しいバージョンの LDP man-pages が po4a で正常に行えることの
確認までを行う。

.. code-block:: console

   $ cd perkamon

LDP man-pages のバージョン番号を更新する。

.. code-block:: console

   $ vi Makefile

   (一番上のバージョン番号を更新する)
   # Upstream version
   V = 3.79

   (必要に応じてダウンロード用の URL を調整)
   man-pages-$(V).tar.xz:
           wget https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/Archive/$@

配布されている LDP man-pages の原文に対して
ローカルの workaround を適用するファイル ``po4a-fixes.patch`` を削除しておく。

.. code-block:: console

   $ rm -f po4a-fixes.patch

.. code-block:: console

   $ make setup
   (build 以下が更新される)
   $ make print-new-files
   (何か表示されたら、po4a/*/*.cfg に追加)
   $ make disable-removed
   (何かないか確認)
   $ git status
   (更新があるはずなので、ここで一度 commit を作成しておくとよい)
   $ git add ....
   $ git commit
   $ cd ..

2. 原文の更新作業
-----------------

perkamon 作業ディレクトリに最新版に対応した展開する

.. code-block:: console

   (manual/LDP_man-pages 以下で実行)
   $ make upgrade

このコマンドでは、以下の作業が行われる。

1. [make jm-setup]

   * 最新版の man-pages の tarball が perkamon/ 直下にダウンロードされる。
   * tarball が perkamon/man-pages ディレクトリに展開される。
   * po4a 作業用の source lang が build/C として用意される。

     * 実際にコンテンツがあるファイルが build/C/man? 以下に man-pages 以下から
       コピーされる。
     * po4a-fixes.patch がある場合には、build/C/ 以下のファイルに適用される。
     * リンクファイルは build/C/link に一覧が作成される。

2. original 以下にコピーする

3. COLOPHON 以下を削除する。

   ``translation_list`` を更新する際に、変更点のみを抽出するために行う。
   COLOPHON 部分はリリース毎にバージョン番号が更新されてしまうので、
   original に登録する際には、この節を削除しておく。

4. original 以下を git で stage する。
5. ``translation_list`` の更新
6. POT の更新
7. 翻訳統計情報の更新

8. Git commit

   この段階のコミットにより、とりあえず原文更新直後の状態が
   一度コミットされることになる。

   .. code-block:: none

      git add translation_list
      git commit -m "LDP: Update original to LDP v3.XX"
      git add po4a/ stats/ untrans.html
      git commit -m "LDP: Update POT and ja.po to LDP v3.XX"

3. 単純な fuzzy の更新
----------------------

COLOPHON が更新されているので、fuzzy が少なくとも一つできる。
ja.po で fuzzy を探してバージョンを更新する。

COLOPHON 以外でも、翻訳に直接関係ないマイナーな更新があれば、
この段階で修正してしまってもよい。
量が多ければ個々の翻訳更新作業の中で行えばよい。

以下では、 PO ファイル更新後に、ドラフトページの生成と翻訳統計を
更新している。内容を確認後、コミットを行う。分かりやすさとファイルの量を
考慮し、ドラフトページとそれ以外を分けてコミットしている。

.. code-block:: console

   $ make
   $ git add -u po4a/ stats/ untrans.html
   $ git commit -m "LDP: Update the version to 3.XX in PO files"

   $ git add draft/
   $ git commit -m "LDP: Update draft pages based on LDP 3.XX release"

公開用のリリースページも一気に更新してしまう場合は以下も実行する。

.. code-block:: console

   $ make release
   $ git add release/
   $ git add -u translation_list
   $ git commit -m "LDP: Update release pages based on LDP 3.XX release"

perkamon について
-----------------

perkamon は LDP man-pages の po4a への変換を支援するスクリプトです。

po4a で翻訳する際に、オプション、変換ルール、対象となるファイルなどを
po4a の cfg (`具体例 <https://osdn.net/users/amotoki/pf/jm/scm/blobs/master/manual/LDP_man-pages/perkamon/po4a/aio/aio.cfg>`__)
として書いておいて、以下のような形で一括で変換することができます。

.. code-block:: console

   $ po4a -k 80  --variable langs='ja' --previous --srcdir . --destdir .  po4a/wchar/wchar.cfg

perkamon がやっていることは、以下の通り。

* この po4a cfg ファイル群を提供
  po4a cfg を使った翻訳生成用の Makefile の提供
  (make translate や make translate-aio などで翻訳できるようにする)
* LDP man-pages から po ファイルへの変換の前作業
  例えば、 link ファイルの除外など。
* LDP man-pages 更新時の po4a cfg 更新の helper script の提供
  (make disable-removed や make print-new-files)
* po4a cfg の中で、翻訳時に追加する header や footer の定義なども含まれている。
  (JM では昔の copyright や翻訳履歴を生成した man に入れるのに使っている)

JM の LDP_man-pages レポジトリの Makefile は perkamon の wrapper になっている。
perkamon のフォルダーで直接作業するのは LDP man-pages のバージョンを更新する
ときのみ。

perkamon という別ディレクトリになっているのは、 LDP man-pages の po4a での管理を
始めた当初、フランス語の翻訳チームがかなり積極的に新しい LDP man-pages に追従
しており、po4a cfg の更新とかもいつの間にか行われていて、JM 側はそれを利用する
だけ、というメリットがあったためです。

ツール群が perkamon という別ディレクトリになっているため、
LDP_man-pages/Makefile では symlink を作成するなど手順が煩雑になっている点は
あります。 perkamon ディレクトリも含めて、JM のレポジトリに取り込んだ現在では、
もう少し単純化できるかもしれませんが、そこはみなさんの判断にお任せします。
