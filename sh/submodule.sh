#!/bin/sh

CMD=$1
PARAMS=$(echo $@|sed -e "s/$CMD//")
REPO_PATH=$(pwd)

for fn in `git submodule|awk '{ print $2 }'`; do
	tput setaf 2
	echo Submodule: $fn
	tput sgr0
	cd $REPO_PATH'/'$fn && git $CMD $PARAMS
	cd $REPO_PATH
done
