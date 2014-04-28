#!/bin/sh

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

if [ `cat $MODULES | grep -cE "^${1}$"` == 1 ] 
then		
	cat $MODULES | awk '{ if ($1 != ".csc") print $1 }' > ~/gitconfig/tmp
	cat ~/gitconfig/tmp > $MODULES
	rm ~/gitconfig/tmp
       	echo ${GREEN}Submodle $1 delete from ignore.${WHITE}
else
       	echo ${PURPLE}Fatal: Submodule not found.${WHITE}
fi
