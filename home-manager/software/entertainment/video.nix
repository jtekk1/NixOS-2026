{ pkgs, ... }:

{
  home.packages = with pkgs; [
    handbrake
    mpv
    shotcut
    wl-screenrec
  ];
}
