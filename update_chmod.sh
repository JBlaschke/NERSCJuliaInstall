#!/usr/bin/env bash


#
# WARNING! This script only works if executed from its directory
#

dir=$(pwd)

# Make everything readable to everyone
pushd ..
chmod -R o+r $dir
chmod o+x $dir
popd

# Make all sub-folders traversible to everyone
find . -type d -exec chmod o+x {} \;

# Make all apps executable to everyone
chmod o+x $dir/julia/$1/bin/julia
if [ -e $dir/packages/intel/$1/julia/bin/mpiexecjl ]; then
    chmod o+x $dir/packages/intel/$1/julia/bin/mpiexecjl
fi
