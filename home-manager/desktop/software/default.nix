{ isMango, optionals, ... }:

{
  imports = [
    ./extras.nix
    ./superfile.nix
    ./kanshi.nix
    ./btop.nix
  ]
  ++ optionals isMango [
    ./sway-audio-idle-inhibit.nix
    ./swayidle.nix
    ./swaylock.nix
    ./swayosd.nix
    ./waybar.nix
    ./wlogout.nix
    ./wofi.nix
  ];
}
