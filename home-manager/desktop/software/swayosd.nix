{ config, ... }:

{
  services.swayosd.enable = true;
  home.file.".config/swayosd/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink ./../../assets/assets/config.toml;
}
