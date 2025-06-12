====================
翻訳手順チートシート
====================

本節は、 翻訳作業を進めるにあたり、JM git リポジトリの操作も含めた手続き全体のチートシートです。
git リポジトリを操作するシステム操作者（翻訳者自身を含む）が適宜参照してください。

1. 翻訳対象パッケージ選定
=========================

1. 対象パッケージが未翻訳／翻訳済みであるかどうかの確認。

   * ``jm.git/manual/<パッケージ名>`` の存在確認。
   * `JM インデックス (作業状況) <https://linuxjm.sourceforge.io/INDEX/>`_ の確認。

2. 翻訳済みである場合のステータス確認（翻訳終了かどうかの確認）。

   * ``jm.git/manual/<パッケージ名>/translation_list`` のステータス記号確認。

2. 翻訳予約に向けた準備
=======================

1. 対象パッケージが未翻訳であった場合のデータ整備。

   * パッケージディレクトリ ``jm.git/manual/<パッケージ名>`` の生成。

     .. code-block:: shell

        $ mkdir jm.git/manual/<パッケージ名>

   * オリジナルソース収容ディレクトリ ``jm.git/manual/<パッケージ名>/original`` の生成。
     その配下に ``man[0-9n]`` 等のサブディレクトリを適宜生成。

     .. code-block:: shell

        $ mkdir jm.git/manual/<パッケージ名>/original

   * ``jm.git/manual/<package>/translation_list`` の初期生成。

     .. note::

        ``translation_list`` の生成スクリプトとして以下がある。

          * ``jm.git/admin/JM-tl-modify.sh``
          * ``jm.git/admin/mktrlist2.sh``
          * ``upd_tl.perl``

        po4a 利用方式を取る場合、po4a 全般の関連ファイルを生成する ``jm.git/support/genmancfg.sh`` があり、これを用いた場合は、初期 translation_list のテンプレート（ひながたとなる）ファイルを生成する。

2. 対象パッケージのオリジナルソースのコピー。

   * ``original`` ディレクトリ配下の削除（対象パッケージが既翻訳であった場合）。

     .. code-block:: shell

        $ rm -fr jm.git/manual/<パッケージ名>/original/*

     .. note::

        既翻訳時と現時点でのオリジナルソースでの差異＝かつて含まれていたものが含まれなくなった場合に対して、不要なオリジナルソースを残さないため。
        この後に ``git rm`` の実行を必要とするかもしれない。

   * ``original`` ディレクトリ配下に ``man[0-9n]`` 等のサブディレクトリを適宜生成。

     .. code-block:: shell

        $ mkdir jm.git/manual/<パッケージ名>/original/man{1,5} # man1, man5 が必要な場合

   * 対象パッケージソースから man ページオリジナルソースをコピー。

     .. code-block:: shell

        $ cp <オリジナルソースディレクトリ>/*.1 jm.git/manual/<パッケージ名>/original/man1
        $ cp <オリジナルソースディレクトリ>/*.5 jm.git/manual/<パッケージ名>/original/man5
        $ ...

3. translation_list のステータス記号記入。

   ============  =================  ============  ==========================
    場合分け      ページ種類         ステータス    ステータス内容
   ============  =================  ============  ==========================
    新規翻訳時    通常manページ      ``▲``        翻訳予約・作業中
    　            リンクページ       ``※``        リンク先が未翻訳・未公開
    既翻訳時      通常manページ      ``■``        改訂予約・作業中
    　            リンクページ       ``※``        リンク先が未翻訳・未公開
   ============  =================  ============  ==========================

   その他作業日付、作業者メールアドレス、作業者名記入。

   .. code-block:: shell

      $ cd jm.git/manual/<パッケージ名>
      $ vi translation_list

3. 翻訳予約
===========

1. 翻訳予約時のソースコミット。``original`` ソース、``translation_list``

     .. code-block:: shell

        $ cd jm.git/manual/<パッケージ名>
        $ git commit \
          original   \
          translation_list

2. `JM discuss メーリングリスト <linuxjm-discuss@lists.sourceforge.net>`_ への翻訳予約メール送信。

   ``TR`` は翻訳の予約（Translation Reservation）

     .. code-block:: shell

        件名:
        [POST:TR] ＜パッケージ名＞ [＜ページ名＞]

        メール本文:
        <STATUS>
        stat: TR
        ppkg: ＜パッケージ名＞
        page: ＜ページ名＞
        date: YYYY/MM/DD
        mail: EMAIL@ADRRESS
        name: FULL NAME
        </STATUS>

3. チケット起票（利用時）。

4. 翻訳作業
===========

ローカル環境にて翻訳作業実施。

* po4a を用いた作業。

  標準的手法の整備なし。
  ``jm.git/support/genmancfg.sh`` あり。

* いわゆる draft ファイルを用いた作業（旧来）。

  ``draft`` ディレクトリにて draft ファイルの編集。

     .. code-block:: shell

        $ cd jm.git/manual/<パッケージ名>
        $ mkdir -p draft; cd draft
        $ mkdir -p man{1,5}                # man1, man5 が必要な場合
        $ cd man1
        $ vi <ページ名>.1

5. 校正依頼に向けた準備
=======================

1. translation_list のステータス記号記入。

   ============  =================  ============  ==========================
    場合分け      ページ種類         ステータス    ステータス内容
   ============  =================  ============  ==========================
    新規翻訳時    通常manページ      ``△``        翻訳終了。校正者募集中
    　            リンクページ       ``＠``        リンク先が翻訳・公開済み
    既翻訳時      通常manページ      ``□``        改訂終了。校正者募集
    　            リンクページ       ``＠``        リンク先が翻訳・公開済み
   ============  =================  ============  ==========================

   その他作業日付、作業者メールアドレス、作業者名記入。

   .. code-block:: shell

      $ cd jm.git/manual/<パッケージ名>
      $ vi translation_list

6. 校正依頼
===========

1. 校正依頼時のソースコミット。

   * 旧来の draft ファイル利用の場合、``draft``, ``translation_list`` のコミット。

     .. code-block:: shell

        $ cd jm.git/manual/<パッケージ名>
        $ git commit \
          draft      \
          translation_list

   * po4a を用いた作業時の draft ファイルについては、標準的運用なし。

     ``jm.git/admin/po4a/gendraft.perl`` により draft ファイルを生成する手立てあり。

     po4a を用いた作業ではこの時点で po4a サブディレクトリを合わせてコミットする。

     .. code-block:: shell

        $ cd jm.git/manual/<パッケージ名>
        $ git commit \
          draft      \
          po4a       \
          translation_list

2. `JM discuss メーリングリスト <linuxjm-discuss@lists.sourceforge.net>`_ への校正依頼メール送信。

   ``DP`` はドラフトの投稿。引き続き自分で校正を行う。（Draft and Proof reservation）

     .. code-block:: shell

        件名:
        [POST:DP] ＜パッケージ名＞ [＜ページ名＞]

        メール本文:
        <STATUS>
        stat: DP
        ppkg: ＜パッケージ名＞
        page: ＜ページ名＞
        date: YYYY/MM/DD
        mail: EMAIL@ADRRESS
        name: FULL NAME
        </STATUS>

        ＜draft ファイル本文＞

3. チケット更新（利用時）。


7. 校正作業
===========

`JM discuss メーリングリスト <linuxjm-discuss@lists.sourceforge.net>`_ 上において、メンバーを交えた校正作業。

適宜応答と、指摘内容への討議、検討、翻訳内容への反映等。

8. リリース判断とその準備
=========================

1. リリースするかどうかを翻訳者当人が判断。

2. ``release`` ディレクトリの生成とリリース成果物の準備

   * 旧来の draft ファイル編集方式に対しては ``jm.git/admin/JM-release.sh`` がある。

   * po4a 利用方式の場合は、最終出力ファイルを release ディレクトリに配置するようにする。

3. translation_list のステータス記号記入。

   =================  ============  ==========================
    ページ種類         ステータス    ステータス内容
   =================  ============  ==========================
    通常manページ      ``○``        校正終了
    リンクページ       ``＠``        リンク先が翻訳・公開済み
   =================  ============  ==========================

   その他作業日付、作業者メールアドレス、作業者名記入。

   .. code-block:: shell

      $ cd jm.git/manual/<パッケージ名>
      $ vi translation_list

9. リリース
===========

1. リリース時のソースコミット。

   .. code-block:: shell

      $ cd jm.git/manual/<パッケージ名>
      $ git commit \
        release    \
        translation_list

2. `JM discuss メーリングリスト <linuxjm-discuss@lists.sourceforge.net>`_ へのリリース報告メール送信。

   ``RO`` はリリースの投稿。(Release Only）

     .. code-block:: shell

        件名:
        [POST:RO] ＜パッケージ名＞ [＜ページ名＞]

        メール本文:
        <STATUS>
        stat: RO
        ppkg: ＜パッケージ名＞
        page: ＜ページ名＞
        date: YYYY/MM/DD
        mail: EMAIL@ADRRESS
        name: FULL NAME
        </STATUS>

3. チケット更新（利用時）。


.. note::

   リリース tarball の生成などは、この後に定例バッチジョブが行うため、作業者は必要ソースをコミットするだけでよい。
