m4_divert(-1)m4_dnl
m4_changecom(`[[[[')m4_dnl
m4_define(`_URI',`      o  $1
         $2')
m4_define(`_WhatisJM',m4_dnl
`  JM Project では 1997 年 2 月の結成以来、 Linux に関する
日本語マニュアルや、その閲覧環境を整備する活動を行っています。

  JM Project の Web Page は下記の URI で閲覧することができます:

_URI(http://www.linux.or.jp/JM/,`JM の TOP ページ')

  必要な作業は文書の翻訳・執筆にとどまりません。マニュアルの
草稿や公開版に対して、実際に試してみて確認し、間違いや不明確な
部分を指摘することも重要な作業です。また文書中のわかりにくい
個所について質問や意見を書いたり、文章表現の校正をすることも
文書の質を高めていくために必要なことです。

  自分でマニュアルの翻訳まではできない、と考えられている方にも、
積極的に参加して頂きたいと思います。是非一緒に「役に立つ文書」を
作っていきましょう。'
)
m4_define(`_NoQuestions',`
  JM-ML はあくまでも作業用の ML であり、Linux の利用方法に関する
質問をする場ではありません。もしあなたが Linux の使い方について
質問したい場合は、

_URI(http://www.linux.or.jp/community/ml/linux-users/index.html,
`Linux Users Mailing List')

をご利用ください。その他の Linux 関連メーリングリストについては

_URI(http://www.linux.or.jp/community/ml/index.html,
日本の Linux 関係のメーリングリスト)

をご参照ください。')
m4_define(`_Signature',`
				JM@linux.or.jp 管理人
				JM-admin@linux.or.jp')
m4_define(`_FirstGuidance',`
  まだご覧になっていない方は、JM Project の Web ページの中で、
Project に関する説明の部分に目を通してください。

_URI(http://www.linux.or.jp/JM/guidance/,
JM 翻訳作業の手引き)

以下にまとめられています。')
m4_define(`_InCaseOfError',`
　JM ML を購読した配送アドレスにエラーが生じた場合には、
管理者がそのアドレスをリストから削除することがあります。
削除されたアドレスは

_URI(http://www.linux.or.jp/JM/mail_error.html,`問題のあるメールアドレス')

に掲載されますので、メールがしばらく届かなくなった場合は、
この URL を確認の上、再度購読の手続きをとってください。')
m4_divert
