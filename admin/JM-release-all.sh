#!/bin/sh

CMDDIR=$(dirname $0)
CMD=$CMDDIR/JM-release.sh

for f in `find draft/ -type f`; do
  $CMD -f -g $f release
done
