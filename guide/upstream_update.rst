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
