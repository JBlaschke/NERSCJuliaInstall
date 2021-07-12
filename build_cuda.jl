using Pkg

Pkg.activate("globalenv", shared=true)

ENV["JULIA_CUDA_USE_BINARYBUILDER"] = "true"

Pkg.add("CUDA")
Pkg.build("CUDA"; verbose=true)
