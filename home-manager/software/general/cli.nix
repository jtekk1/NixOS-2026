{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wget
    xstow
  ];
}
