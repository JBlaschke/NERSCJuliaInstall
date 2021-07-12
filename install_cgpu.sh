#!/usr/bin/env bash

set -e


tolower () { echo $1 | awk '{ print tolower($1) }'; }


install_env () {
    julia instantiate_globalenv.jl  
    julia build_mpi.jl $OPENMPI_DIR
    julia build_ijulia.jl
    julia build_tools.jl
    julia build_cuda.jl
    julia install_mpi.jl
}

install_all () {
    module purge
    module load cgpu gcc cuda/11.3.0 openmpi julia/1.6.0

    export JULIA_DEPOT_PATH=$JULIA_ADMIN_PATH
    install_env

    module unload julia
}

install_all
