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
    ./../../hardware/btop-intel.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "thinkpad";
}
