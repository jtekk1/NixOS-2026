{ pkgs, ... }:

{
  home.packages = with pkgs; [
    blanket
    spotify
  ];
}
