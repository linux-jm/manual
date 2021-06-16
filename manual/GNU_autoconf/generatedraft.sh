#!/bin/sh

PACKAGE=which

mkdir -p tmp

for p in `ls original`; do
  if test -d original/$p; then
    for f in `ls original/$p`; do
      BASENAME=`echo $f | sed -e "s/\.[^\.]*$//"`
      echo $BASENAME...
      FILES="draft/$p/$f "
      FILES+="original/$p/$f "
      if test -f "po4a/add_ja/copyright/$f.txt"; then
        FILES+="po4a/add_ja/copyright/$f.txt "
      fi
      FILES+="po4a/ja.po "
      FILES+="po4a/$PACKAGE.cfg "
      FILES+="po4a/$PACKAGE.pot "
      FILES+="translation_list"
      tar cf - $FILES | gzip > tmp/$f.tar.gz
    done
  elif test -f $p; then
    echo $f...
    FILES="draft/$f "
    FILES+="original/$f "
    if test -f "po4a/add_ja/copyright/$f.txt"; then
      FILES+="po4a/add_ja/copyright/$f.txt "
    fi
    FILES+="po4a/ja.po "
    FILES+="po4a/$PACKAGE.cfg "
    FILES+="po4a/$PACKAGE.pot "
    FILES+="translation_list"
    tar cf - $FILES | gzip > tmp/$f.tar.gz
  fi
done

echo "done."
