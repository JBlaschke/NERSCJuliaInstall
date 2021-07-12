using Pkg

Pkg.activate("globalenv", shared=true)

Pkg.add("BenchmarkTools")
Pkg.build("BenchmarkTools"; verbose=true)
