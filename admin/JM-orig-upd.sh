#!/bin/sh
#------------------------------------------------------------
# man pages のオリジナルの更新を支援するスクリプトです。
#
# オリジナルの配布物を展開した際に、マニュアルが man[1-8]
# というフォルダに格納されている場合に利用できます。
#
# オリジナルの配布物の man[1-8] があるフォルダで実行します。
# 引き数には、JM の git repository のアップデートしたいパッケージ
# の original/ フォルダを指定します。
# 
# original/ を更新したら、git2upd や upd_tl.perl を使用して
# translation_list を更新して下さい。
#------------------------------------------------------------

SECS="man1 man2 man3 man4 man5 man6 man7 man8"

CVS_ORIG=$1

if [ -z "$1" ]; then
    echo "Usage: $0 <dest_cvs_ORIG_dir>"
    exit 1
fi

CURDIR=`/bin/pwd`

# remove original files
cd $CVS_ORIG
echo cd $CVS_ORIG
echo -n "Checking directories ..."
for s in $SECS; do
    if [ ! -d $s ]; then
	echo "directory $CVS_ORIG/$s not found."
	exit 1
    fi
done
echo "done"
echo -n "Removing old original files ..."
find . -type f | grep -v /CVS/ | xargs rm
echo "done"

cd $CURDIR
echo cd $CURDIR
echo -n "Copying new files to original: "
for s in $SECS; do
    cp ${s}/* $CVS_ORIG/${s}
    echo -n "$s "
done
echo "done"
echo "Copy *.lsm if needed !!!"
