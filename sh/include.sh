repo_path=$(pwd)
modules=$(git rev-parse --show-toplevel)'/.git/.s-modules'

if [ ! -f $modules ]
then
        touch $modules
fi

args=""
for arg in "$@"
do
	args="$args '$arg'"
done

for fn in `git submodule|awk '{ print $2 }'`; do
	if [ `cat $modules | awk -v s=$fn '{ if( $1==s) print 0 }' | wc -l` != 1 ] 
	then
		echo ${GREEN}----------------------------------------
		echo Submodule: $fn
		echo ----------------------------------------${WHITE}
		cd $repo_path'/'$fn
		bash -c "git $args"
		cd $repo_path
	fi
done
