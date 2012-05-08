#!/bin/sh

if [ -z "$1" ]; then
  echo "Usage: $0 original/manN/pagename.N"
  exit 1
fi

if [ -e tmp ]; then
  mkdir tmp
  echo "Created 'tmp'."
fi

PAGE=$1
ORIG=$PAGE
TRANS=$(echo $PAGE | sed -e 's|original|release|')
POOUT=tmp/$(basename $PAGE).ja.po

po4a-gettextize -f man -L ja_JP.UTF-8 \
  -p $POOUT -m $ORIG -l $TRANS
