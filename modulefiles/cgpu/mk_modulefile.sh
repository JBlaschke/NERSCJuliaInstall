#!/usr/bin/env bash

root_dir=$(dirname "${BASH_SOURCE[0]}")
sw_root=$(readlink -f $root_dir/../..)

mk_test_mod () {
cat > $root_dir/julia/$1 <<EOF
#%Module1.0
##

## Required internal variables

set    name              julia
set    version           $1
set    sw_root           $2
set    root              \$sw_root/\$name/\$version
set    mpich_compiler    cgpu
set    admin_depot       \$sw_root/packages/\$mpich_compiler/\$version/\$name
set    pkg_depot         \$admin_depot:\$root/local/share/julia:\$root/share/julia

## List conflicting modules here

conflict \$name

## List prerequisite modules here

# prereq

## Required for SVN hook to generate SWDB entry

set    fullname        Julia
set    externalurl     https://julialang.org/
set    nerscurl        https://docs.nersc.gov/development/languages/julia/
set    maincategory    applications
set    subcategory     ""
set    description     "Flexible dynamic language, appropriate for scientific and numerical computing, with performance comparable to traditional statically-typed languages"

## Required for "module help ..."

proc ModulesHelp { } {
  global description nerscurl externalurl
  puts stderr "Description - \$description"
  puts stderr "NERSC Docs  - \$nerscurl"
  puts stderr "Other Docs  - \$externalurl"
}

## Required for "module display ..." and SWDB

module-whatis "\$description"

## Software-specific settings exported to user environment
prepend-path    PATH                \$root/bin
prepend-path    PATH                \$admin_depot/bin
prepend-path    JULIA_DEPOT_PATH    \$env(HOME)/.julia:\$pkg_depot
setenv          JULIA_ADMIN_PATH    \$admin_depot
prepend-path    JULIA_LOAD_PATH     "@:@v#.#:\$admin_depot/environments/globalenv:@stdlib"
setenv          JULIA_CUDA_USE_BINARYBUILDER    false

## MODS reporting
if [ module-info mode load ] {
    catch { exec /bin/sh /global/common/shared/das/mods2/bin/modster.sh $name $version }
}
EOF

}

mk_test_mod 1.6.0 $sw_root
