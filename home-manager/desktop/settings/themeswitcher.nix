{ config, ... }:

{
  home.file.".config/ThemeSwitcher".source =
    config.lib.file.mkOutOfStoreSymlink "/home/jtekk/NixOS/assets/ThemeSwitcher";
}
