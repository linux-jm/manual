#!/bin/sh -e

filter_commits() {
    # Don't include files where the only things which have changed are
    # the creation date, the version number, the revision date,
    # comment lines, or diff file information.
    for f in `git diff --cached --name-only`; do
        if [ ! -e "$f" ]; then
            continue
        fi
        # It's ok if the grep fails
        set +e
        changed=$(git diff --cached "$f" \
            | egrep -v "(POT-Creation-Date|Project-Id-Version|PO-Revision-Date|Last-Translator|Language-Team):" \
            | egrep -c "^([-+][^-+#])")
        set -e
        if [ $changed -eq 0 ]; then
            git reset -q "$f"
            git checkout -- "$f"
        fi
    done
}

WRAP=1

while getopts nh OPT; do
  case $OPT in
    n) WRAP=0 ;;
    h|\?)
      echo 'Usage: $0 [-n]'
      exit 1
      ;;
  esac
done

if [ "$WRAP" -eq 0 ]; then
  ARGS="--no-wrap"
fi

set -o xtrace

cd po4a
for category in *; do
  echo $category
  cd $category/po
  msgmerge $ARGS --previous --output ja-new.po ja.po ${category}.pot
  mv ja-new.po ja.po
  cd ../..
done
cd ..
git add po4a/
filter_commits
git reset HEAD -- po4a/
