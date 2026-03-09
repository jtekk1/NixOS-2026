{ pkgs, ... }:

{
  imports = [
    ./dependencies.nix
    ./launchers.nix
    ./tools.nix
  ];
}
