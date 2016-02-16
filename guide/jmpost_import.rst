=============================================
投稿された man ページのレポジトリへの登録方法
=============================================

JM では所定のフォーマット http://linuxjm.sourceforge.jp/guidance/mailformat.html で
翻訳した man ページを ML に投稿してもらうことになっています。

この形式で投稿された man ページを JM の Git Repository に取り込む方法です。

手順
====

#. メールを保存します。
   投稿されたメールは変換せずに保存して下さい。私は Wanderlust で保存しています。
#. Git Repository 内に移動します。
   Repository 内であればどこでも構いません
#. 以下のコマンドを実行します。

   .. code-block:: console

      cat <saved-mail> | nkf -Lu -w | <repo_top>/admin/ml2cvs

#. 変更内容を確認します。
#. コミットします。
   コミットメッセージは特に決まりはありませんが、
   パッケージ名は先頭に付けるようにしています。
   こんな感じで書いていることが多いです。

   .. code-block:: console

      <パッケージ名>: Draft <ページ名> [JM:nnnnn]
      <パッケージ名>: Release <ページ名> [JM:nnnnn]

   [例]

   .. code-block:: console

      sudo: Drafts posted in [JM:00631] to [JM:00635].
      procps: release watch.1 [JM:00428]

#. sourceforge.jp の git repo に push します。ウェブページは cron で更新されます。

実行例
======

.. code-block:: console

   motoki@gemini:~/.../JM/jm.git (master)$ cat ~/tmp/1086.eml | nkf -Lu -w | admin/ml2cvs
   UPDATE: admin/../manual/net-tools/translation_list
   UPDATE: admin/../manual/net-tools/draft/man8/ifconfig.8
   UPDATE: admin/../manual/net-tools/ChangeLog
   motoki@gemini:~/.../JM/jm.git (master)$ git status
   # On branch master
   # Changes not staged for commit:
   #   (use "git add <file>..." to update what will be committed)
   #   (use "git checkout -- <file>..." to discard changes in working directory)
   #
   #       modified:   manual/net-tools/ChangeLog
   #       modified:   manual/net-tools/draft/man8/ifconfig.8
   #       modified:   manual/net-tools/translation_list
   #
   motoki@gemini:~/.../JM/jm.git (master)$ git diff
   motoki@gemini:~/.../JM/jm.git (master)$ git add -u
   motoki@gemini:~/.../JM/jm.git (master)$ git commit
   [master 5981012] net-tools: Draft ifconfig.8 [JM:00811]
    3 files changed, 7 insertions(+), 2 deletions(-)
   motoki@gemini:~/.../JM/jm.git (master)$ git push
   Counting objects: 17, done.
   Delta compression using up to 2 threads.
   Compressing objects: 100% (9/9), done.
   Writing objects: 100% (9/9), 1013 bytes, done.
   Total 9 (delta 7), reused 0 (delta 0)
   To ssh://amotoki@git.sourceforge.jp/gitroot/linuxjm/jm.git
      7616130..5981012  master -> master
   motoki@gemini:~/.../JM/jm.git (master)$ git push
   Counting objects: 17, done.
   Delta compression using up to 2 threads.
   Compressing objects: 100% (9/9), done.
   Writing objects: 100% (9/9), 1013 bytes, done.
   Total 9 (delta 7), reused 0 (delta 0)
   To ssh://amotoki@git.sourceforge.jp/gitroot/linuxjm/jm.git
      7616130..5981012  master -> master
