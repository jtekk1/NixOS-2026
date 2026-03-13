{ pkgs, ... }:

{
  services.polkit-gnome.enable = true;
  services.mako.enable = true;
  # services.swaync.enable = true;

  home.packages = with pkgs; [
    brightnessctl
    chrony
    cliphist
    grim
    libnotify
    playerctl
    shotman
    slurp
    swaybg
    swww
    udiskie
    upower
    xcursorgen
    xdg-user-dirs
    wl-clip-persist
    wl-clipboard
    wlopm
    wlsunset
  ];
}
