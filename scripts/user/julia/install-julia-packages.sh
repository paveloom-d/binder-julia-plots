#!/bin/sh

echo '\n\e[1;36mInstalling Julia packages:\e[0m'

echo '\e[1;36m> Rebuilding `IJulia`...\e[0m'
julia -e 'using Pkg; Pkg.build("IJulia")' >/dev/null 2>&1

echo '\e[1;36m> Installing `GRUtils`...\e[0m'
julia -e 'using Pkg; Pkg.add("GRUtils"); using GRUtils' >/dev/null 2>&1

echo '\e[1;36m> Installing `PyPlot`...\e[0m'
julia -e 'using Pkg; Pkg.add("PyPlot"); using PyPlot' >/dev/null 2>&1

echo '\e[1;36m> Installing `Plots`...\e[0m\n'
julia -e 'using Pkg; Pkg.add("Plots"); using Plots' >/dev/null 2>&1