#!/bin/sh

OUTPUT=ja.po
HEADER_TMPL=0_POT_HEADER
SCRIPT_DIR=`dirname $0`

TEMP=`mktemp`

if [ -z "$1" ]; then
    echo "Usage: $0 ja.po.1 [ja.po.2 ja.po.3 ...]"
    exit 1
fi

if [ -e $OUTPUT ]; then
    echo "$OUTPUT: output file exists."
    exit 1
fi

cat $SCRIPT_DIR/$HEADER_TMPL > $TEMP
for f in $*; do
    if [ -f $f ]; then
	sed -e '1,18d' $f >> $TEMP
    fi
done
msguniq $TEMP > $OUTPUT
echo "ja.po generated."
rm -f $TEMP
