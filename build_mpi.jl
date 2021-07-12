using Pkg

Pkg.activate("globalenv", shared=true)

ENV["JULIA_MPI_BINARY"] = "system"
ENV["JULIA_MPI_PATH"]   = ARGS[1]
ENV["JULIA_MPIEXEC"]    = "srun"

Pkg.add("MPI")
Pkg.build("MPI"; verbose=true)
Pkg.add("MPIClusterManagers")
Pkg.build("MPIClusterManagers"; verbose=true)
