#!/bin/sh

THRESH=80

usage_exit() {
    echo "Usage: $0 [-m minimum-perc]"
    exit 1
}

while getopts hm: OPT; do
    case $OPT in
        m) THRESH=$OPTARG ;;
        #h) usage_exit ;;
        h|\?) usage_exit ;;
    esac
done

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

VENV=$SCRIPT_DIR/../venv

if ! which virtualenv > /dev/null; then
    echo "virtualenv not found. Make sure to have virtualenv installed."
    exit 2
fi

if [ ! -d $VENV ]; then
    virtualenv $VENV
fi

. $VENV/bin/activate
pip freeze | grep -q watchdog
if [ $? -ne 0 ]; then
    pip install watchdog
fi

# Ensure all pending manpage generations are done
make

echo 'Starting watchmedo to generate draft pages automatically...'
echo "(minimum threshold is ${THRESH}%)"
watchmedo shell-command \
    --command "make THRESH=$THRESH; date; echo" \
    --wait --recursive \
    --pattern 'po4a/*/ja.po' \
    po4a
