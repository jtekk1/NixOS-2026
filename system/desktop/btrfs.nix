{ ... }:

{
  # Enable BTRFS auto-scrubbing to detect and repair data corruption
  services.btrfs.autoScrub.enable = true;
  services.btrfs.autoScrub.interval = "weekly";
  services.btrfs.autoScrub.fileSystems = [ "/" ];
}
