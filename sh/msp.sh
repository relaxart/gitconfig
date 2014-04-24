#!/bin/bash
d=$(pwd);
for fn in `git submodule|awk '{ print $2 }'`;
	do cd $d'/'$fn && git stash pop&>/dev/null
	cd $d
done;
cd $d;
git stash pop&>/dev/null
