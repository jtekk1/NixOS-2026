{ isMango, optionals, ... }:

{
  imports = [
    ./icons.nix
  ]
  ++ optionals isMango [
    ./dconf.nix
    ./gtk-qt-theming.nix
    ./themeswitcher.nix
    ./xdg.nix
  ];
}
