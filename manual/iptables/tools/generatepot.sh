#!/bin/bash -e

target=$1

p=$(echo $target | sed -E -e 's|(.*\.([1-8]))|man\2/\1|')

pofile=po4a/$p.ja.po
potfile=po4a/$p.pot
master=original/$p
if sed -e '1,3!d' $master | grep -q '^\.so '; then
  echo "Skip link file $master"
else
  echo "po4a-gettextize $potfile <- $master"
  po4a-gettextize -f man -p $potfile -m $master
fi
