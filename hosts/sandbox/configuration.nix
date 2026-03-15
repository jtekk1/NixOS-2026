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

  specialisation = {
    ZenKernel.configuration = {
      boot.kernelPackages = pkgs.linuxPackages_latest;
    };
  };

  networking.hostName = "sandbox";
}
