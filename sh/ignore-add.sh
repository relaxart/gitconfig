#!/bin/bash

source $(dirname $0)/color.sh

MODULES=$(git rev-parse --show-toplevel)'/.git/.s-modules'

if [ ! $1 ] 
then 
	echo ${PURPLE}Fatal: no submodule path given.${WHITE}
	exit
fi

if [ ! -f $MODULES ] 
then 
	touch $MODULES
fi

if [ `git submodule | awk '{ print $2 }' | grep -cE "^${1}$"` == 1  ] 
then
	if [ `cat $MODULES | grep -cE "^${1}$"` == 1 ] 
	then
        	echo ${PURPLE}Fatal: submodule already added.${WHITE}
	else
		$(echo $1 >> $MODULES)
        	echo ${GREEN}Submodule add. Success.${WHITE}
	fi
else
        echo ${PURPLE}Fatal: no submodule path find.${WHITE}
fi
