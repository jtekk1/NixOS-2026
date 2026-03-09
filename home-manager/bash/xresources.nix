{ pkgs, ... }:

{
  home.pointerCursor = {
    name = "Yaru";
    package = pkgs.yaru-theme;
    size = 24;
    x11.enable = true;
    gtk.enable = true;
  };

  xresources.properties = {
    "Xft.dpi" = 120;
  };
}
