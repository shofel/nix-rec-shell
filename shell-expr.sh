#!bash

# suppress the logs of nix
exec 2>/dev/null

# calculate new state
((STATE++))

nix-shell -v -E                                                    \
"let                                                               \
   NIXPKGS_TARBALL=https://github.com/NixOS/nixpkgs/archive/nixos-22.11.tar.gz; \
   pkgs = import (fetchTarball NIXPKGS_TARBALL) {};             \
 in                                                                \
   pkgs.mkShell {                                                  \
     buildInputs = with pkgs; [hello]; \
     shellHook = \"echo ${STATE}; sleep 2; STATE=${STATE} exec bash shell-expr.sh\";
   }"
