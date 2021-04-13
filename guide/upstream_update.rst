==================
オリジナル更新方法
==================

JM Repository の構成は :doc:`git_repository` に書かれている通りです。

JM の翻訳の管理方法は

* roff を直接翻訳
* po4a を使って翻訳

の 2 つの方法が混在しています。

オリジナルの更新方法もどちらの管理方法をとっているかによって異なります。

po4a を使用している場合には、各パッケージのディレクトリに po4a というフォルダが存在します。
存在しない場合は、roff を直接編集して翻訳しています。

roff を直接翻訳
===============

後できちんと書きたいと思います。

関連するコマンド群は以下 (だったと思う)

* admin/JM-orig-upd.sh
* admin/git2upd
* admin/upd_tl.perl

.. warning::

   ``git2upd`` コマンドは新しい git status の出力に対応していないので注意。

   ``git2upd`` コマンドは、 ``git add`` コマンドで staged された原文を
   ``git status`` コマンドの出力に基づいて ``upd_tl.perl`` に渡すファイルを
   作成するが、以下のように staged されたファイルリストの前に空行があることを
   期待している。しかし、新しめの git ではこの空行が出力されないため、
   ``git2upd`` コマンドが期待通り動作しない。本来は ``git2upd`` コマンドを修正
   すべきだが、とりあえずの対処としては ``git status original`` の出力を保存
   した上で、必要な空行を挿入して対処する。
   (少なくとも git 2.25.1 では空行が出力されないことを確認している。)

   .. code-block:: console

      HEAD detached at 015f61e7
      Changes to be committed:
       (use "git restore --staged <file>..." to unstage)

             modified:   original/Changes
             modified:   original/Changes.old
             modified:   original/README
             renamed:    original/man-pages-3.79.Announce -> original/man-pages-5.10.Announce
             renamed:    original/man-pages-3.79.lsm -> original/man-pages-5.10.lsm
             modified:   original/man1/getent.1
             modified:   original/man1/iconv.1
             ...



po4a を使って翻訳
=================

(to be written)

LDP man-pages
=============

:ref:`LDP_man-pages <ldp_original_update>` を参照。

GNU coreutils
=============

:ref:`GNU_coreutils <coreutils_original_update>` を参照。

``help2man`` の出力と、追加ファイル ``*.x`` の翻訳を合わせて、
日本語マニュアルを生成しています。
そのため、管理が他のものと異なっています。
