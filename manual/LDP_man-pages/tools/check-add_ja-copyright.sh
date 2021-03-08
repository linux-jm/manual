#!/bin/bash

if [ ! -d draft ]; then
    echo "draft directory not found."
    exit 1
fi
if [ ! -d add_ja/copyright ]; then
    echo "add_ja/copyright directory not found."
    exit 1
fi

cd draft
for f in `find man? -type f`; do
    if [ ! -f ../add_ja/copyright/$f ]; then
	echo "add_ja/copyright/$f does not exist for draft/$f"
    fi
done
