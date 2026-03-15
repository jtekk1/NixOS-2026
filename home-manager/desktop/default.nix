{ isMango, optionals, ... }:

{
  imports = [
    ./settings
    ./software
  ]
  ++ optionals isMango [
    ./waybar.nix
    ./desktop-shell.nix
    ./mango-settings
    ./mango.nix
  ]
  ++ optionals (!isMango) [
    ./kde.nix
  ];
}
