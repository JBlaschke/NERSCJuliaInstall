#!/usr/bin/env bash

set -e


tolower () { echo $1 | awk '{ print tolower($1) }'; }


install_env () {
    julia instantiate_globalenv.jl  
    julia build_mpi.jl $CRAY_MPICH_DIR
    julia build_ijulia.jl
    julia build_tools.jl
    julia build_cuda.jl
    julia install_mpi.jl
}

install_all () {
    __pe=$(tolower $PE_ENV)
    # TODO: fix aocc -- when it's ready
    # pes=(aocc cray gnu nvidia)
    pes=(cray gnu nvidia)

    echo $__pe

    last_pe=$__pe
    for pe in ${pes[@]}
    do
        module swap PrgEnv-$last_pe PrgEnv-$pe
        module load cudatoolkit julia

        export JULIA_DEPOT_PATH=$JULIA_ADMIN_PATH
        install_env

	module unload julia
        last_pe=$pe
    done
    module swap PrgEnv-$last_pe PrgEnv-$__pe
}

install_all
