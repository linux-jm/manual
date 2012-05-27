#!/bin/bash -x

#if [ -z "$1" ]; then
#    echo "Usage: $0 <version>"
#    exit 1
#fi
#VERSION=$1

if [ ! -e translation_list ]; then
    echo "translation_list not found."
    exit 1
fi
VERSION=$(grep -v "=>" translation_list | head -1 | cut -d : -f 3)
if [ -z $VERSION ]; then
    echo "Version could not be extracted from translation_list."
    echo "This package may not be ready to be released."
    exit 1
fi

DIR=`pwd`
PACKAGE=$(basename $DIR)
DATE=`date +%Y%m%d`
DATESTRING=`date "+%b %d, %Y"`

RELDIR=${PACKAGE}-${VERSION}-${DATE}

if [ ! -e release ]; then
    echo "'release' not found."
    exit 2
fi

mkdir $RELDIR
cp -pr release/* $RELDIR
cp dist/* $RELDIR
sed -i -e "s/@DATE@/$DATE/g" \
    -e "s/@DATESTRING@/$DATESTRING/g" \
    -e "s/@VERSION@/$VERSION/g" $RELDIR/README
tar cjf ${RELDIR}.tar.bz2 ${RELDIR}
