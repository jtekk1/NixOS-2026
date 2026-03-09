{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gsettings-desktop-schemas
    libsForQt5.qt5.qtwayland

    papirus-icon-theme
  ];
}
