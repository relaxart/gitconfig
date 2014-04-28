#!/bin/sh

source $(dirname $0)/color.sh

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
		echo ${GREEN}----------------------------------------
		echo Submodule: $fn
		echo ----------------------------------------${WHITE}
		cd $REPO_PATH'/'$fn && git $CMD $PARAMS
		cd $REPO_PATH
	fi
done
