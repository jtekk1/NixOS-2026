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

  boot.kernelPackages = pkgs.linuxPackages_zen;
  hardware.xpadneo.enable = true;
  networking.hostName = "deepspace";
}
