{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    discord
    (lib.hiPrio (writeShellScriptBin "discord" ''
      # Ensure Wayland display is set
      export WAYLAND_DISPLAY=''${WAYLAND_DISPLAY:-wayland-1}
      export XDG_SESSION_TYPE=''${XDG_SESSION_TYPE:-wayland}
      export NIXOS_OZONE_WL=1

      # Launch Discord with proper environment
      exec ${discord}/bin/discord "$@"
    ''))
  ];
}
