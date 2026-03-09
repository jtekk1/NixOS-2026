{ pkgs, ... }:

{
  imports = [
    ./obs.nix
    ./greetd.nix
    ./steam.nix
    ./swaylock.nix
  ];

  services.packagekit.enable = true;
  programs.xwayland.enable = false;

}
