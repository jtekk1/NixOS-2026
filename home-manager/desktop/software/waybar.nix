{ config, ... }:

{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "mango-session.target";
    };
  };

  systemd.user.services.waybar = {
    Service = {
      Environment = [
        "PATH=/run/wrappers/bin:${config.home.profileDirectory}/bin:/run/current-system/sw/bin"
      ];
    };
  };

  home.file.".config/waybar/mango-menu.xml".source = ./../../../assets/waybar/mango-menu.xml;
  home.file.".config/waybar/style.css".source =
    config.lib.file.mkOutOfStoreSymlink ./../../../assets/waybar/style.css;
}
