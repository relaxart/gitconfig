#!/bin/sh
d=$(pwd);
for fn in `git submodule|awk '{ print $2 }'`;
	do cd $d'/'$fn && git stash pop;
	cd $d
done;
cd $d;
git stash pop;
