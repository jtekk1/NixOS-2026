{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    (lib.hiPrio conjure)
    inkscape
    imagemagick
    imv
    pinta
    satty
    swappy
  ];
}
