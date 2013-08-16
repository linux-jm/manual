#!/bin/sh

RM=/bin/rm
MV=/bin/mv
SED=/bin/sed

usage() {
    echo "Usage: `basename $0` <draft file> <release directory>"
    echo "Options:"
    echo "  -c : Copy mode. By default, sed is used to remove JM comments."
    echo "  -f : Force Override the existing page"
    echo "  -g : Guess the release directory from the draft location"
    echo "  -v : Verbose mode"
}

COPY=0
FORCE=0
GUESS=0
VERBOSE=0

while getopts "cfgv" OPT
do
  case $OPT in
    "c") COPY=1 ;;
    "f") FORCE=1 ;;
    "g") GUESS=1 ;;
    "v") VERBOSE=1 ;;
    *)   usage ;;
  esac
done

shift `expr $OPTIND - 1`

# FORCE=0
# if [ "$1" = "-f" ]; then
#   FORCE=1
#   shift
# fi

if [ -z "$1" -a -z "$2" ]; then
  usage
  exit 1
fi

DRAFT=$1
RELDIR=$2
MANPAGE=`basename $DRAFT`
if [ $GUESS -eq 1 ]; then
  RELEASE=`echo $RELDIR/$(dirname $DRAFT | sed -e 's/^.*\///')/$MANPAGE`
else
  RELEASE=`echo $RELDIR/$MANPAGE`
fi

if [ ! -f $DRAFT ]; then
  echo "draft file $DRAFT does not exist!"
  exit 1
fi

if [ ! -d $RELDIR ]; then
  echo "release directory $RELDIR does not exist!"
  exit 1
fi

if test -f $RELEASE && cmp $DRAFT $RELEASE > /dev/null; then
  if [ $VERBOSE -eq 1 ]; then
    echo "Skipped $(basename $DRAFT): draft and release pages are same."
  fi
  exit 0
fi

if [ -f $RELEASE -a $FORCE -ne 1 ]; then
  echo -n "Overwrite $RELEASE (y/N) "
  read ret
  if [ "$ret" = "y" -o "$ret" = "Y" ]; then
    echo "Remove $RELEASE"
    $RM $RELEASE
  else
    echo "Can't overwrite $RELEASE. Aborted"
    exit 1
  fi
fi

if [ $COPY -eq 1 ]; then
  cp -fpv $DRAFT $RELEASE
else
  $SED -e '/^\.\\\"O /d' $DRAFT > $RELEASE
  echo "$DRAFT -> $RELEASE"
fi

#echo "Succeed"
