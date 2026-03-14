{ pkgs, ... }:

{

  home.packages = with pkgs; [
    watchexec
    wev

    asciiquarium 
    cmatrix
    pipes 
    sl

    widevine-cdm
    flatpak 
    gnome-keyring 
    wayland-utils 
    xinput 
    xrdb 
    xstow

    flatpak
    claude-code

    tailscale 
    slack 
    zoom-us
  ];
}
