#!/bin/sh

MODULES=$(git rev-parse --show-toplevel)'/.git/.s-modules'

if [ ! $1 ] 
then 
	tput setaf 1 
	echo Fatal: no submodule path given.
	tput sgr0
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
		tput setaf 1
        	echo Fatal: submodule already added.
        	tput sgr0
	else
		$(echo $1 >> $MODULES)
		tput setaf 2
        	echo Submodule add. Success.
        	tput sgr0
	fi
else
	tput setaf 1
        echo Fatal: no submodule path find.
        tput sgr0
fi
