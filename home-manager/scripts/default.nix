{ ... }:

{
  imports = [
    ./layout-notify.nix
    ./restart-systemd-service.nix
    ./screenshot-area.nix
    ./setup-fido2-ssh.nix
    ./status-weather.nix
    ./toggle-sunset.nix
    ./wofi-clipboard.nix
    ./wofi-theme-switcher.nix
  ];
}
