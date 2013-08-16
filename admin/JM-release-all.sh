#!/bin/sh

CMDDIR=$(dirname $0)
CMD=$CMDDIR/JM-release.sh

OPTS="-f -g"

# optparse
while getopts "cv" OPT
do
  case $OPT in
    "c") OPTS="${OPTS} -c" ;;
    "v") OPTS="${OPTS} -v" ;;
  esac
done

for d in draft/man?; do
  for f in `find $d -type f | sort`; do
    $CMD $OPTS $f release
  done
done
