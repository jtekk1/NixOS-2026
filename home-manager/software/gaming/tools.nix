{ pkgs, ... }:

{
  home.packages = with pkgs; [
    mangohud
    vkbasalt
  ];
}
