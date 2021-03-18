#!/bin/bash

usage() {
    cat <<-EOF
	Usage: $0 <pagename>
	
	Examples:
	  $0 arp.7
	  $0 draft/man7/arp.7
	EOF
    exit 1
}

if [ "$1" = "" ]; then
    usage
fi
PAGENAME=$(basename $1)

DIR=$(pwd)
if [ $(basename $DIR) != "LDP_man-pages" ]; then
    echo "[ERROR] Please run in LDP_man-pages top directory!"
    exit 1
fi

CFG=$(grep -l /$PAGENAME po4a/*/*.cfg)
if [ -z "$CFG" ]; then
    echo "[ERROR] PO file for $PAGENAME is not found!"
    exit 2
fi
SEC=$(echo $CFG | cut -d / -f 2)
POFILE=po4a/$SEC/po/ja.po
echo "$PAGENAME -> $POFILE"
