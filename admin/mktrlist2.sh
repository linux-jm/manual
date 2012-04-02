#!/bin/bash
#
# 新しいパッケージをリポジトリに入れた時に
# translation_listを自動作成するスクリプト with (N)AWK and BASH
#
# original/ディレクトリ以下にファイルを揃えてから、
# translation_listがあるべきディレクトリで実行して下さい。
# オリジナルからのコピーにおいてファイル日付が保存されていることを
# 前提にしています。"cp -p" や "cp -a" を使ってください。
# パッケージ名はディレクトリから、バージョンはlsmファイルから
# 所得します。ただし、コマンドライン引数で指定されたものを優先します。
# 標準出力に結果を出力するので、適当にリダイレクトして下さい。
#
# BUG:
# ・シンボリックリンクには対応していません。
# ・manページの日付所得に失敗することが多々あります。
# ・マクロ ".so" によるリンクには対応していません。
# ・ls コマンドは coreutils にあるもの(version 5.x)を前提としています

print_usage () {
(
    exec 1>&2

    echo "$0: [ -p package ] [ -v version ] [ -l G | B | M | N ]"
    echo '-p | --package <package>'
    echo '	set package name'
    echo '-v | --version <version>'
    echo '	set version of package'
    echo '-l | --license <license type>'
    echo '	set license type'
    echo '	  G: GPL2'
    echo '	  B: BSD'
    echo '	  M: Miscellaneous'
    echo '	  N: Not for commercial'
)
}

NAWK=awk
PWD=`pwd`
PKG=`basename $PWD`

STATUS='×'

# $1: <dir>
# output: <file> <YYYY/MM/DD>
stat_dir () {
    pushd $1 > /dev/null

    LANG=C /bin/ls -l --full-time | $NAWK '

BEGIN{
    getline;	# skip first line
}
($9 !~ /CVS/){
    s=$6; gsub(/-/, "/", s); print $9, s;
}'
    popd > /dev/null
}

# $1: <file>
# output: common date string(unkown format)
# output: or ".so <link>"
get_date_or_link_file () {
    local header
    header=`grep -i '^\.TH' $1 2> /dev/null`

    if [ $? -eq 0 ]; then
	echo $header | POSIXLY_CORRECT=1 $NAWK '
{
    if ($0 !~ /([^ ]+ +){3}/) {
	exit 1;
    }

    sub(/([^ ]+[ ]+){3}/, "");
    sub(/"/, "");
    sub(/".*/, "");
    sub(/^ */, "");
    print;
}'
	return
    fi

    header=`grep -i '^\.Dd' $1 2> /dev/null`

    if [ $? -eq 0 ]; then
	echo $header | $NAWK '
{
    $1 = "";
    substr(/^ */, "");
    print;
}'
	return
    fi

    header=`grep -i '^\.so' $1 2> /dev/null`
    if [ $? -eq 0 ]; then
	echo $header
	return
    fi

    return 1
}	

# $1: roff file to parse
# $2: default date (which is used if parsing is fault)
# output: date string or ".so link"
get_date_or_link () {
    local date=`get_date_or_link_file $1`
    if [ $? -ne 0 -o -z "$date" ]; then
	echo $2
	return 0
    fi

    case "$date" in
	.so*)
	    # link
	    echo $date
	    ;;
	*,*)
	    # month date, year
	    echo $date | $NAWK '{sub(/,/,"",$2); print $3 "/" $1 "/" $2}'
	    ;;
	*)
	    # date month year
	    echo $date | $NAWK '{print $3 "/" $2 "/" $1}'
	    ;;
    esac
    return
}

# input:  "YYYY/Month_name/DD..."
# output: "YYYY/MM/DD..."
month2name () {
    $NAWK '
BEGIN {
    FS = "/";
    OFS = "/";
    month["Jan"] = "01";    month["Feb"] = "02";    month["Mar"] = "03";
    month["Apr"] = "04";    month["May"] = "05";    month["Jun"] = "06";
    month["Jul"] = "07";    month["Aug"] = "08";    month["Sep"] = "09";
    month["Oct"] = "10";    month["Nov"] = "11";    month["Dec"] = "12";
}
{
    $2 = month[substr($2,1,3)];
    print;
}'
}

# obtain version information from LSM
# $1: LSM file path
# $2: default version (which is used if it fail to obtain version)
get_version () {
    local ver_line=`grep -i "^Version:" $1 2> /dev/null`
    if [ $? -ne 0 ]; then
	echo $2
	return
    fi
    echo $ver_line | $NAWK '{print $2}'
}

######
# main
######
while [ $# -ge 1 ]; do
    case $1 in
	-v|--version)
	    if [ $# -eq 1 ]; then
		print_usage
		exit 1
	    fi
	    shift
	    VERSION="$1"
	    shift
	    ;;
	-p|--package)
	    if [ $# -eq 1 ]; then
		print_usage
		exit 1
	    fi
	    shift
	    PKG="$1"
	    shift
	    ;;
	-l|--license)
	    if [ $# -eq 1 ]; then
		print_usage
		exit 1
	    fi
	    shift
	    case "$1" in
		[BGM])
		    LICENSE=$1
		    ;;
		*)
		    echo "Unkown License Type: $1" 1>&2
		    print_usage
		    exit 1
		    ;;
	    esac
	    shift
	    ;;
	-h|--help)
	    print_usage
	    exit 0
	    ;;
	*)
	    echo "Unkown option: $1" 1>&2
	    print_usage
	    exit 1
	    ;;
    esac

done

# check LSM
LSM=`echo original/*.lsm`
if [ -f "$LSM" ]; then
    VERSION=`get_version $LSM $VERSION`
fi

mandirs=`echo original/man[0-9]*`
for d in $mandirs
do
    stat_dir $d | while read file date
    do
	DATE=`get_date_or_link $d/$file $date`
	case "$DATE" in
	    .so*)
		echo $DATE
		;;
	    *)
		DATE=`echo $DATE | month2name`
		MAN=`echo $file | sed 's/\.\([^.]*\)/:\1/'`
		echo "$STATUS:$PKG:$VERSION:$DATE:$MAN::$LICENSE:::"
		;;
	esac
    done
done
