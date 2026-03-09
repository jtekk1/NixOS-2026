{ ... }:

{
  wayland.windowManager.mango.settings = ''
    exec-once=$HOME/.config/mango/autostart.sh
    exec-once=wl-clip-persist --clipboard regular --reconnect-tries 0 --all-mime-type-regex '^(?!x-kde-passwordManagerHint).+'
    exec-once=wl-paste --type text --watch cliphist store
    exec-once=wl-paste --type image --watch cliphist store
    exec-once=xrdb -merge ~/.Xresources
    exec-once=sway-audio-idle-inhibit
  '';
}
