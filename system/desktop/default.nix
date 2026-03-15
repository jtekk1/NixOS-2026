{ isMango, optionals, ... }:

{
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./btrfs.nix
    ./dconf.nix
    ./deployment-tools.nix
    ./services.nix
    ./snapshots.nix
    ./zram.nix
  ]
  ++ optionals (!isMango) [
    ./kde.nix
  ];
}
