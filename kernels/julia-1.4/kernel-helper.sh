#!/usr/bin/env bash

module load julia/1.4.2
exec /global/common/cori_cle7/software/julia/julia/1.4.2/bin/julia -i --startup-file=yes --color=yes /global/common/cori_cle7/software/julia/packages/intel/1.4.2/julia/packages/IJulia/latest/src/kernel.jl "$@"
