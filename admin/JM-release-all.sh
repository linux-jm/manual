#!/bin/bash

CMDDIR=$(dirname $0)
CMD=$CMDDIR/JM-release.sh

OPTS="-f -g -q"

TARGET_DIR="draft/man?"

init_progress() {
    COUNT=0
    WIDTH=70
    TOTAL=`find $TARGET_DIR -type f | wc -l`
}

show_progress() {
    COUNT=`expr $COUNT + 1`

    PROGRESS=`expr 100 \* $COUNT / $TOTAL`

    PREV_DONE=$W_DONE
    W_DONE=`expr $WIDTH \* $PROGRESS / 100`
    W_REST=`expr $WIDTH - $W_DONE`

    #if [ "$PREV_DONE" == "$W_DONE" ]; then
    #	return
    #fi

    if [ "$W_DONE" -eq 0 ]; then
	STR_DONE=""
    else
	STR_DONE=`printf "%0${W_DONE}d" 0 | tr 0 =`
    fi
    if [ "$W_REST" -eq 0 ]; then
	STR_REST=""
    else
	STR_REST=`printf "%${W_REST}s" " "`
    fi
    STR_PROG=`printf "%4d/%d (%3d%%)" $COUNT $TOTAL $PROGRESS`

    echo -ne "|${STR_DONE}${STR_REST}| ${STR_PROG}\r"
}

finish_progress() {
    echo -ne "\n"
}

##################################################
# Main Routine
##################################################

# optparse
while getopts "cv" OPT
do
    case $OPT in
	"c") OPTS="${OPTS} -c" ;;
	"v") OPTS="${OPTS} -v" ;;
    esac
done

init_progress

for d in $TARGET_DIR; do
    for f in `find $d -type f | sort`; do
	$CMD $OPTS $f release
	show_progress
    done
done

finish_progress
