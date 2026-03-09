{ config, pkgs, ... }:

{
  imports = [
    ./amd.nix
    ./amd-gaming.nix
    ./yubikey.nix
    ./zsa.nix
  ];
  
  environment.systemPackages = with pkgs; [
    config.boot.kernelPackages.xpadneo
  ];
}
