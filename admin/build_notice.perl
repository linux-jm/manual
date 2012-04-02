#!/usr/bin/perl -w
#
# JM-ML に毎月のお知らせを投げるスクリプト。
# cron build をする 3 日前の 0:30 に実行すること。
#
$SENDMAIL = '/usr/lib/sendmail JM@linux.or.jp';

$builddate = `date --date="3 days" +'%Y/%m/%d'`;
$deadline  = `date --date="2 days" +'%Y/%m/%d'`;
chomp $builddate;
chomp $deadline;

open MS, "| nkf -j | $SENDMAIL" || die "cannot invoke sendmail\n";

print MS <<EOM;
From: JM bulid master <nakano\@master.linux.or.jp>
To: JM\@linux.or.jp
Subject: [ANN] monthly release $builddate

(このメールは毎月自動で投稿されます)

　JM 配布アーカイブ更新のお知らせです。

	$builddate 00:05:00

にアーカイブの更新ビルドを開始します。

　$deadline 一杯までに JM-ML に投稿されたページや、
CVS リポジトリにチェックインされたページは更新に
反映されます。

　公開できるページの手持ちがある方は、よろしく
お願いします。

-- 
JM build master
nakano\@master.linux.or.jp
EOM
close (MS);

