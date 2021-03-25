# Netfilter project

* http://www.netfilter.org/projects/iptables/index.html
* http://www.netfilter.org/projects/iptables/downloads.html

# original 更新時のメモ

## man pages の生成

configure や make の中で man が準備されるので make まで行う。
configure のオプションで man の内容が変化するかは確認していないが、
念のため configure の出力で "Iptables Configuration" で
全部が "yes" になるようにしている。

::

  tar xf iptables-1.8.4.tar.bz2
  cd iptables-1.8.4
  ./configure --enable-bpf-compiler --enable-libipq --enable-nfsynproxy
  make

生成された man の確認。

::

  ls -1 **/*.[1-8]

## original の更新

ここからは iptables のトップディレクトリに移動して作業する。
やっていることとしては、 original 以下のファイルを全部削除してから、
新しいバージョンの man をコピーする。
iptables-1.8.4 時点では man1/man3/man8 だけだが、
他のセクションも追加されていれば、適宜コピーする。

::

  cd ..
  find original -type f | xargs rm
  cp iptables-1.8.4/**/*.1 original/man1
  cp iptables-1.8.4/**/*.3 original/man3
  cp iptables-1.8.4/**/*.8 original/man8

変更内容を git で stage しておく。

::

   git add original

ここで po4a 変換の動作確認を行っておく。

::

   make updatepo

エラーが出た場合は、エラー箇所を確認し、
必要に応じて original 以下の該当ファイルを変更する、
po4a のオプションを追加するなどの対応を行う。

original 以下に変更を行った場合は、
変更内容を `patch.original` として保存しておく。

::

   git diff -- original > patch.original

## 変更内容の translation\_list への反映

`translation_list` の更新を行う。
更新があった original 以下の変更を git で stage した上で
以下のコマンドを実行する。
最初のコマンドの実行後に `upd.txt` の内容を確認しておくとよい。

::

   git status . | ../../admin/git2upd > upd.txt
   sed -i -e 's|0000/00/00|2021/03/24|' upd.txt
   ../../admin/upd_tl.perl translation_list upd.txt 1.8.4

## git への登録

最後に変更内容をすべて git に commit する。
