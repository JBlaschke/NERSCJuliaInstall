using Pkg

Pkg.activate("globalenv", shared=true)

Pkg.add("IJulia")
Pkg.build("IJulia"; verbose=true)


import IJulia
IJulia.installkernel("Julia")


function get_root(ppath::String)
    root::String=ppath
    name::String=string()
    for i=1:3
        path=splitdir(root)
        root=path[1]
        name=path[2]
    end
    root, name
end


root, name = get_root(pathof(IJulia))
cd(root)
if ispath("latest")
    rm("latest")
end
symlink(name, "latest")
