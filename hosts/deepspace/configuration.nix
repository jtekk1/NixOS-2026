{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix
    ./../../system/desktop
    ./../../software
    ./../../hardware
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.xpadneo.enable = true;
  networking.hostName = "deepspace";
}
