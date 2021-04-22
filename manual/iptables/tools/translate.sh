#!/bin/bash -e

target=$1

p=$(echo $target | sed -E -e 's|(.*\.([1-8]))|man\2/\1|')
pofile=po4a/$p.ja.po
potfile=po4a/$p.pot
master=original/$p
trans=draft/$p
addendum=po4a/add_ja/copyright/$target.txt

mkdir -p $(dirname $master)

if sed -e '1,3!d' $master | grep -q '^\.so '; then
  echo "Skip link file $master"
else
  echo "Processing $target..."
  po4a-translate $PO4AFLAGS -f man -p $pofile -l $trans -m $master \
    --addendum $addendum
fi
