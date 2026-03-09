{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    colmena
    sops
  ];
}
