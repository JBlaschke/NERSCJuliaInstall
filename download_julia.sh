#!/usr/bin/env bash

# Make sure we've got the Julia Releases public key
gpg --import downloaded/keys/juliareleases.asc


pushd downloaded/$1.$2
# Download
wget https://julialang-s3.julialang.org/bin/linux/x64/$1/julia-$1.$2-linux-x86_64.tar.gz
# Check key
gpg --verify julia-$1.$2-linux-x86_64.tar.gz.asc
popd
