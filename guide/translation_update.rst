============
翻訳更新方法
============

JM Repository の構成は :doc:`git_repository` に書かれている通りです。

JM の翻訳の管理方法は

 * roff を直接翻訳
 * po4a を使って翻訳

の2つの方法が混在しています。

po4a を使用している場合には、各パッケージのディレクトリに po4a というフォルダが存在します。
存在しない場合は、roff を直接編集して翻訳しています。

roff を直接翻訳
===============

release 版を編集する場合は、必ず draft を編集してから、 release に反映して下さい。
draft 側には、原文がコメントとして入っていますが、release には翻訳済みの文章のみが含まれます。

.. note::

   以下の説明は、各パッケージのディレクトリ (manual/fetchmail など) で作業することを前提に説明します。

#. draft を更新します
#. draft の更新が終わったら、release に反映します。
   対象ファイルを draft 以下から release 以下にコピーするだけですが、 JM-release.sh コマンドを利用するのが楽です。

   .. code-block:: none

      $ ../../admin/JM-release.sh -f -g draft/man1/fetchmail.1 release
      draft/man1/fetchmail.1 -> release/man1/fetchmail.1

#. Git でコミットして、sourceforge.jp に push します。

draft 以下の全ファイルを release に反映する場合は、JM-release-all.sh コマンドを実行します。
draft の全ファイルがリリース済みの場合に release への反映もれがないかを確認する際などに使います。

.. code-block:: none

   $ cd manual/fetchmail
   $ ../../admin/JM-release-all.sh
   (git status や git diff で変更内容を確認)
   (git commit -> git push)

po4a を使って翻訳
=================

**LDP\_man-pages と GNU\_coreutils は管理方法が少し複雑です。詳細は下の方にありますので参照して下さい。**

翻訳は po4a ディレクトリ以下の ja.po ファイルで管理しています。
ja.po ファイルは po4a/ja.po の場合と、po4a/<dir>/ja.po にある場合があります。

#. man ページに対応する ja.po がどれかは ``po4a/**/*.cfg`` を見て判断します。
   更新したいファイルが分かっている場合は以下のように grep して下さい。

   .. code-block:: none

      $ grep iptables-save.8 po4a/**/*.cfg

#. ja.po を編集します。編集にあたっては Emacs の po-mode, poedit などが利用できます。
#. make または make translate で ja.po の内容を draft 以下に反映します。
#. (参考 make stat で ja.po の翻訳状況を表示できます)
#. release に反映する必要がある場合は、「roff を直接翻訳」の場合と同様に JM-release.sh を使用して、release フォルダ以下に反映して下さい。
#. git commit で更新を登録して、git push で sf.jp に送信して下さい

po4a 移行後の課題
-----------------

* レビューをどのようにして行うか?
* ja.po を投稿してもレビューできない。 できあがった draft でレビューする必要がある。
* translation-list の更新が手動になっている
* 複数のファイルが一つの ja.po の変更で更新されることがあり、管理が面倒

LDP man-pages
=============

:doc:`LDP_man-pages` を参照。

GNU_coreutils
=============

:doc:`GNU_coreutils` を参照。

``help2man`` の出力と、追加ファイル ``*.x`` の翻訳を合わせて、
日本語マニュアルを生成しています。
そのため、管理が他のものと異なっています。
