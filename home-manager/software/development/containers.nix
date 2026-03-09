{ pkgs, ... }:

{
  home.packages = with pkgs; [
    distrobox
    boxbuddy

    podman-tui
    podman-desktop
    podman-compose
    podman-bootc
    xorriso
    virtiofsd

    lazydocker
    virt-viewer
  ];
}
