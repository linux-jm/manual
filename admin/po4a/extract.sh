#!/bin/sh

CMD=../../admin/po4a/extract-jp-copyright.pl

for f in `find release/ -type f`; do
  DEST=po4a/add_ja/copyright/$(basename $f).txt
  $CMD $f > $DEST
  echo $f "=>" $DEST
done
