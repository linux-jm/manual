.. _ldp_original_update:

========================
LDP man-pages 管理ガイド
========================

準備
====

:ref:`ldp_preparation` を参照してください。

原文の更新方法
==============

Git Repo 以下はきれいな状態にした状態で始めること。

作業手順は以下の通り。

1. perkamon の更新
2. 原文の更新作業
3. 単純な fuzzy の更新

1. perkamon の更新
------------------

.. code-block:: console

   cd perkamon
   git remote add upstream git://gitorious.org/perkamon/man-pages.git
   git remote update
   git checkout master
   git merge upstream/master
   git push origin
   cd -

現状 JM 用の perkamon は amotoki が管理する GitHub Repository
https://github.com/amotoki/perkamon.git にあります。
Commit 権が必要であれば Collaborator に登録しますので、連絡下さい。

オリジナルが更新されていない場合は自分で更新する

.. code-block:: console

   cd perkamon
   vi Makefile
   (Update the version number at the top)
   rm -f stamp-*
   make setup
   (build 以下が更新される)
   make print-new-files
   (何か表示されたら、po4a/*/*.cfg に追加)
   make disable-removed
   (何かないか確認)
   git status
   (更新があれば git commit & git push origin)

2. 原文の更新作業
-----------------

perkamon 作業ディレクトリに最新版に対応した展開する

.. code-block:: console

   make upgrade

以下の作業が行われる。

* [make jm-setup]

  * 最新版の man-pages の tarball が perkamon/ 直下にダウンロードされる。
  * tarball が perkamon/man-pages ディレクトリに展開される。
  * po4a 作業用の source lang が build/C として用意される。

    * 実際にコンテンツがあるファイルが build/C/man? 以下に man-pages 以下から
      コピーされる。
    * po4a-fixes.patch がある場合には、build/C/ 以下のファイルに適用される。
    * リンクファイルは build/C/link に一覧が作成される。

* original 以下にコピーする

* COLOPHON 以下を削除する。

  translation\_list を更新する際に、変更点のみを抽出するために行う。
  COLOPHON 部分はリリース毎にバージョン番号が更新されてしまうので、
  original に登録する際には、この節を削除しておく。

* original 以下を git で stage する。
* translation\_list の更新
* POT の更新
* 翻訳統計情報の更新

* Git commit

  .. code-block:: none

     git add translation_list
     git commit -m "LDP: Update original to LDP v3.XX"
     git add po4a/ stats/ untrans.html
     git commit -m "LDP: Update POT and ja.po to LDP v3.XX"

3. 単純な fuzzy の更新
----------------------

COLOPHON が更新されているので、fuzzy が少なくとも一つできる。
ja.po で fuzzy を探してバージョンを更新する。

.. code-block:: console

   make
   git add -u po4a/ stats/ untrans.html
   git commit -m "LDP: Update the version to 3.XX in PO files"

   git add draft/
   git commit -m "LDP: Update draft pages based on LDP 3.XX release"

   make release
   git add release/
   git add -u translation_list
   git commit -m "LDP: Update release pages based on LDP 3.XX release"
