{ ... }:

{
  imports = [
    ./bootloader.nix
    ./development.nix
    ./fonts.nix
    ./networking.nix
    ./nix-settings.nix
    ./openssh.nix
    ./users.nix
    ./xdg.nix
  ];
}
