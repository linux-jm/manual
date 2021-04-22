#!/bin/bash -e

target=$1

p=$(echo $target | sed -E -e 's|(.*\.([1-8]))|man\2/\1|')
pofile=po4a/$p.ja.po
potfile=po4a/$p.pot
master=original/$p
if sed -e '1,3!d' $master | grep -q '^\.so '; then
  echo "Skip link file $master"
elif [ -f $pofile ]; then
  echo "po4a-updatepo $pofile <- $master"
  po4a-updatepo -f man --previous --msgmerge-opt="$MSGMERGE_OPTS" \
    -p $pofile -m $master
else
  echo "po4a-gettextize $pofile <- $master"
  mkdir -p `dirname $pofile`
  po4a-gettextize -f man -p $pofile -m $master
  sed -i -e 's|"Content-Type: text/plain; charset=CHARSET\\n"|"Content-Type: text/plain; charset=UTF-8\\n"|' $pofile
  cp $pofile $potfile
  msgmerge "$MSGMERGE_OPTS" -o $pofile $pofile $potfile
  rm -f $potfile
fi
