{ isMango, optionals, ... }:

{
  imports = [
    ./settings
    ./software
  ]
  ++ optionals isMango [
    ./desktop-shell.nix
    ./mango-settings
    ./mango.nix
  ]
  ++ optionals (!isMango) [
    ./kde.nix
  ];
}
