#!/bin/sh

CMD=$1
PARAMS=$(echo $@|sed -e "s/$CMD//")
REPO_PATH=$(pwd)
MODULES=$(git rev-parse --show-toplevel)'/.git/.s-modules'

if [ ! -f $MODULES ]
then
        touch $MODULES
fi

for fn in `git submodule|awk '{ print $2 }'`; do
	if [ `cat $MODULES | awk -v s=$fn '{ if( $1==s) print 0 }' | wc -l` != 1 ] 
	then
		tput setaf 2
		echo Submodule: $fn
		tput sgr0
		cd $REPO_PATH'/'$fn && git $CMD $PARAMS
		cd $REPO_PATH
	fi
done
