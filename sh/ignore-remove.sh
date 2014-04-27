#!/bin/sh

MODULES=$(git rev-parse --show-toplevel)'/.git/.s-modules'

if [ ! $1 ] 
then 
	tput setaf 1 
	echo Fatal: no submodule path given.
	tput sgr0
fi

if [ ! -f $MODULES ] 
then 
	touch $MODULES
fi

if [ `cat $MODULES | grep -cE "^${1}$"` == 1 ] 
then		
	cat $MODULES | awk '{ if ($1 != ".csc") print $1 }' > ~/gitconfig/tmp
	cat ~/gitconfig/tmp > $MODULES
	rm ~/gitconfig/tmp
		
	tput setaf 2
       	echo Submodle $1 delete from ignore.
       	tput sgr0
else
	tput setaf 1
       	echo Fatal: Submodule not found.
       	tput sgr0
fi
