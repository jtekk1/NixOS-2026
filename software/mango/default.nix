{ pkgs, ... }:

{
  imports = [
    ./greetd.nix
    ./swaylock.nix
  ];

  services.packagekit.enable = true;
  programs.xwayland.enable = false;
}
