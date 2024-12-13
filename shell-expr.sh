nix-shell -v -E  2>/dev/null \
"let                                                               \
   url=https://github.com/NixOS/nixpkgs/archive/nixos-22.11.tar.gz; \
   pkgs = import (fetchTarball url) {};             \
 in                                                                \
   pkgs.mkShell {                                                  \
     shellHook = ''
       echo ${STATE:-0}
       sleep 2
       STATE=$((++STATE)) exec bash shell-expr.sh
     '';
   }"
