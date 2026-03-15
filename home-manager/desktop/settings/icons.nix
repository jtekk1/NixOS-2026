{ ... }:

{
  home.file.".icons" = {
    source = ../../../assets/icons/mouse-themes;
    recursive = true;
  };

  home.file.".local/share/icons" = {
    source = ../../../assets/icons/app-icons;
    recursive = true;
  };
}
