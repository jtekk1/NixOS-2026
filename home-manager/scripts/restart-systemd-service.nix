{ pkgs, ... }:

let
  restart-app = pkgs.writeShellScriptBin "restart-app" ''
    if [ -z "$1" ]; then
      echo "Usage: restart-app [waybar|mako|swayosd|all]"
      exit 1
    fi

    case "$1" in
      waybar|mako|swayosd)
        echo "Restarting $1 via systemd..."
        systemctl --user restart "$1.service"
        ;;
      all)
        echo "Restarting Wayland UI services..."
        systemctl --user restart waybar.service mako.service swayosd.service
        ;;
      *)
        echo "Error: Unknown service '$1'"
        exit 1
        ;;
    esac
  '';

in
{
  home.packages = [
    restart-app
  ];
}
