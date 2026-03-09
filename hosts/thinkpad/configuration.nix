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
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "thinkpad";

  security.wrappers.btop = {
    owner = "root";
    group = "root";
    capabilities = "cap_perfmon+ep";
    source = "${pkgs.btop}/bin/btop";
  };
}
