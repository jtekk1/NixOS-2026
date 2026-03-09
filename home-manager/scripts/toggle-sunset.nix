{ pkgs, ... }:

let
  toggle-sunset = pkgs.writeShellScriptBin "toggle-sunset" ''
    # Check if wlsunset is running
    if pgrep -x "wlsunset" > /dev/null; then
        # It is running, so kill it (Turn OFF)
        pkill -x wlsunset
        notify-send -t 2000 "Night Light" "Disabled"
    else
        # It is not running, so start it (Turn ON)
        # -T 4501 (Day) and -t 4500 (Night) effectively forces 4500K immediately
        wlsunset -T 4501 -t 4500 &
        notify-send -t 2000 "Night Light" "Enabled (4500K)"
    fi
  '';

in
{
  home.packages = with pkgs; [
    # 1. Your custom script
    toggle-sunset

    # 2. Strict dependencies
    wlsunset
    libnotify # Provides the 'notify-send' command
  ];
}
