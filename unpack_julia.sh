#!/usr/bin/env bash

mkdir -p julia

pushd julia
tar xvf ../downloaded/$1/julia-$1-linux-x86_64.tar.gz
mv julia-$1 $1
popd
