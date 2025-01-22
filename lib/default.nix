{lib, ...}: {
  mkCompilables = path:
    lib.genAttrs
    (lib.mapAttrsToList
      (name: type: lib.elemAt (lib.splitString "." name) 0)
      (lib.filterAttrs
        (name: type: type == "regular")
        (builtins.readDir path)))
    (name: import "${path}/${name}.nix");

  mkModules = path:
    lib.mapAttrs
    (name: type:
      if type == "directory"
      then import "${path}/${name}"
      else throw "Failed to import module of type: ${type}")
    (lib.filterAttrs
      (name: type: name != "default.nix")
      (builtins.readDir path));
}
