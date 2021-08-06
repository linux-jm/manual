#!/bin/sh

SRCDIR=~/src/GNU/diffutils/diffutils-3.8

rm -fr man1
mkdir  man1
cp -p $SRCDIR/man/*.1 man1
