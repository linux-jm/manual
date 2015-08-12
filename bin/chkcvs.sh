#!/bin/sh
#
# CVS リポジトリを調べるスクリプト.
# JM/stamp/cvs-release-modified → release/, contrib/ 以下のページが変わったかどうか
# JM/stamp/cvs-status-modified → translation_list が変わったかどうか
#
RM=stamp/cvs-release-modified
SM=stamp/cvs-status-modified
IM=stamp/info-release-modified

if [ ! -f $RM ]; then
	touch $RM
elif (find manual -newer $RM | egrep "(release|contrib)/man[1-9]/.*\.[1-9]"); then
	touch $RM
	touch $SM
fi

if [ ! -f $SM ]; then
	touch $SM
elif (find manual -name translation_list -newer $SM | grep -q "."); then
	touch $SM
fi

if [ ! -f $IM ]; then
        touch $IM
elif (find info -newer $IM | grep -q "release"); then
        touch $IM
fi

