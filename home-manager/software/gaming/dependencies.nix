{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wine
    winetricks
    vkd3d-proton

    protonplus
    protonup-qt
    protontricks
    gamescope
  ];
}
