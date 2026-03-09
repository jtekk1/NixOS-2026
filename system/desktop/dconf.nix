{ pkgs, ... }:

{
  programs.dconf.enable = true;
  services.dbus.packages = [ pkgs.gsettings-desktop-schemas ];
}
