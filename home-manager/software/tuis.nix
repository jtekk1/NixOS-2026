{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bluetui
    dialog
    dust
    htop
    gdu
    glow
    impala
    lazygit
    ncdu
    wiremix
  ]; 
}
