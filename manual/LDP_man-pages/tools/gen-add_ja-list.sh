#!/bin/bash

if [ ! -d add_ja/copyright ]; then
    echo "add_ja/copyright directory not found."
    exit 1
fi

cd add_ja/copyright
for f in `find man? -type f`; do
    list=../lists/$f.list
    if [ ! -f $list ]; then
	echo po4a/add_ja/copyright/$f > $list
	echo "Created add_ja/lists/$f.list"
    fi
done
