{ config, ... }:

{
  time.timeZone = "America/Denver";
  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  hardware.enableRedistributableFirmware = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than +15";
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
    trusted-users = [ "root" ];
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

}
