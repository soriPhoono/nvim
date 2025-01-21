{lib, ...}:
lib.mapAttrs
(name: type:
    if type == "directory"
    then import ./${name}
    else throw "Testing testing 123")
(
  lib.filterAttrs
  (name: type: name != "default.nix")
  (builtins.readDir ./.)
)
