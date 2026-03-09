{ ... }:

{
  wayland.windowManager.mango.settings = ''
    # Wofi launchers and menus
    bind=SUPER,space,spawn,wofi --show drun
    bind=SUPER,r,spawn,wofi --show run
    bind=SUPER,v,spawn,wofi-clipboard-menu

    # Dim lights
    bind=SUPER+CTRL,l,spawn,toggle-sunset

    # Lock screen
    bind=SUPER+CTRL,Escape,spawn,swaylock -F -f -C ~/.config/swaylock/config

    # Notification center
    bind=SUPER,backspace,spawn,swaync-client -t
    bind=SUPER+SHIFT,backspace,spawn,swaync-client -C

    # Waybar toggle
    bind=SUPER+SHIFT,b,spawn_shell,restart-app waybar
    # bind=SUPER+ALT,b,spawn_shell,
    bind=SUPER+SHIFT,t,spawn_shell,wofi-theme-switcher

    # Power menu
    bind=SUPER,Escape,spawn,wlogout -sC ~/.config/wlogout/style.css -l ~/.config/wlogout/layout

    # Scratchpad
    bind=SUPER,minus,toggle_scratchpad

    # Screenshots
    bind=CTRL+ALT,4,spawn,grim - | wl-copy
    bind=CTRL+SHIFT,4,spawn,~/.local/bin/screenshot-area --clipboard
    bind=CTRL+ALT,a,spawn_shell,grim -g "$(slurp -b '#2E2A1E55' -c '#88c0d0ff')" -t ppm - | satty -f -
  '';
}
