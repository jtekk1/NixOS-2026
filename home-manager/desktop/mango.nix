{ inputs, ... }:

{
  imports = [
    inputs.mango.hmModules.mango
  ];

  wayland.windowManager.mango = {
    enable = true;
    systemd = {
      enable = true;
      xdgAutostart = true;
      extraCommands = [
        "systemctl --user reset-failed"
        "systemctl --user start mango-session.target"
      ];
    };
    autostart_sh = ''
      # Triggering systemd activation
      export MYDEBUG_VAL="yes"
    '';
    settings = ''
      source=~/.config/ThemeSwitcher/current/mango-colors.conf
    '';
  };
}
