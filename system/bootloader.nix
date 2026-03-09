{ pkgs, lib, ... }:

{
  boot.loader = {
    limine = {
      enable = true;
      style = {
        wallpapers = [ ../dots/limine/wallpaper ];
        wallpaperStyle = "centered";
      };
      extraConfig = ''
        TIMEOUT=0
      '';
    };
  };
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth = {
    enable = true;
    logo = "${pkgs.nixos-icons}/share/icons/hicolor/48x48/apps/nix-snowflake-white.png";
    theme = "solar";
  };
}
