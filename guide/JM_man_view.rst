=======================
JM-man-view.el の使い方
=======================

``JM-man-view`` とは、メール本文が man page のファイルのものを整形して表示するための Emacs Lisp です (Emacs 上で動くメーラを使っている人は特に便利です)。

必要なもの
==========

* `JM-man-view.el <http://git.sourceforge.jp/view?p=linuxjm/jm.git;a=blob_plain;f=admin/JM-man-view.el;hb=HEAD>`_
* `woman.el <https://sites.google.com/site/fjwcentaur/emacs>`_ (emacs21 以降では標準添付になっており、特に入手の必要はありません)
* Emacs (woman.el が XEmacs 上では動かないので XEmacs はダメです)

設定方法
========

1. ``woman.el`` と ``JM-man-view.el`` を ``load-path`` に置きます。 具体的には、例えば ~/elisp/ に両者を置き、 .emacs に

   .. code-block:: none

      (setq load-path (cons (expand-file-name "~/elisp") load-path))

   と追記するとよいでしょう。
2. .emacs に以下を追記します。

   .. code-block:: none

      ;; woman
      (autoload 'woman "woman"
        "Decode and browse a UN*X man page." t)
      (autoload 'woman-find-file "woman"
        "Find, decode and browse a specific UN*X man-page file." t)
      ;; JM-man-view
      (autoload 'JM-man-view "JM-man-view" nil t)
      (autoload 'JM-man-mail-view "JM-man-view" nil t)

以上で設定は終わりです。

使いかた
========

メールが表示されているバッファに移動して、
``M-x JM-man-view`` とすれば、 ``woman`` によって整形されたマニュアルが
別フレーム (X ならウィンドウ) に表示されます。
Wanderlust/Mew を使っている場合は、 Summary モードで ``M-x JM-man-mail-view`` とすれ
ばマニュアルが表示されます。

メールの条件
============

``JM-man-view.el`` は、整形対象とするバッファにおける roff 文書に対して、以下の仮定を置いています。

* マニュアル部分の先頭行は、roffのコメントである .\" で始まる (行頭が .\")
* メール本文の最後まで manual である(= 本文の末尾にコメント等がない)

JMpost で投げられるマニュアルは上の条件を満たしますので、 特に意識しなくともかまいません。

制限
====

現在のところ、``woman.el`` は mdoc 形式のマニュアルの変換ができないようです。
したがって ``JM-man-view.el`` でも、 この形式のマニュアルは閲覧できないことになります。
