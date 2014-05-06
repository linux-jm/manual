#!/bin/bash

export LANG=C
export LC_TIME=C

JMHOME=/home/groups/l/li/linuxjm
GITDIR=$JMHOME/jm.git
LOGDIR=$JMHOME/log

test -d $LOGDIR || mkdir -p $LOGDIR
LOGFILE=$LOGDIR/log-$(/bin/date +%Y%m%d-%H%M%S).txt
touch $LOGFILE

echo "===== git pull =====" >> $LOGFILE 2>&1
cd $JMHOME/jm.git
git pull >> $LOGFILE 2>&1
git submodule update --init --recursive >> $LOGFILE 2>&1

echo "===== Update web contents =====" >> $LOGFILE 2>&1
make >> $LOGFILE 2>&1

# clean up logs
find $LOGDIR -mtime +30 -exec rm -f {} \; -print >> $LOGFILE 2>&1
