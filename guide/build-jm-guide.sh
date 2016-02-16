#!/bin/bash

JMHOME=${JMHOME:-/home/groups/l/li/linuxjm}
VENV=$JMHOME/venv
JM_GIT=$HOME/jm

LOCAL_PIP_BASE=$HOME/.local
GET_PIP_URL=https://raw.github.com/pypa/pip/master/contrib/get-pip.py

if [ ! -f $LOCAL_PIP_BASE/bin/pip ]; then
    wget $GET_PIP_URL
    python get-pip.py --user
    rm -f get-pip.py
fi
if [ ! -f $LOCAL_PIP_BASE/bin/virtualenv ]; then
    $LOCAL_PIP_BASE/bin/pip install --user virtualenv
fi
if [ ! -d $VENV ]; then
    $LOCAL_PIP_BASE/bin/virtualenv $VENV
fi

. $VENV/bin/activate
pip install sphinx sphinx-bootstrap-theme
make $*
