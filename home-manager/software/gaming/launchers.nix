{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lutris
    heroic-unwrapped
    umu-launcher
    faugus-launcher
  ];
}
