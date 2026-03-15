{ ... }:

{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "fmask=0022"
                  "dmask=0022"
                ];
              };
            };
            luks = {
              end = "-4G";
              content = {
                type = "luks";
                name = "crypted";
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "@" = {
                      mountpoint = "/";
                      mountOptions = [
                        "compress=zstd:1"
                        "noatime"
                        "ssd"
                        "space_cache=v2"
                        "discard=async"
                      ];
                    };
                    "@home" = {
                      mountpoint = "/home";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                        "ssd"
                        "space_cache=v2"
                        "discard=async"
                      ];
                    };
                    "@nix" = {
                      mountpoint = "/nix";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                        "ssd"
                        "space_cache=v2"
                        "discard=async"
                      ];
                    };
                    "@log" = {
                      mountpoint = "/var/log";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                        "ssd"
                        "space_cache=v2"
                        "discard=async"
                      ];
                    };
                    "@tmp" = {
                      mountpoint = "/var/tmp";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                        "ssd"
                        "space_cache=v2"
                        "discard=async"
                      ];
                    };
                    "@cache" = {
                      mountpoint = "/var/cache";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                        "ssd"
                        "space_cache=v2"
                        "discard=async"
                      ];
                    };
                    "@snapshot" = {
                      mountpoint = "/.snapshot";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                        "ssd"
                        "space_cache=v2"
                        "discard=async"
                      ];
                    };
                    "@hm-snapshot" = {
                      mountpoint = "/home/.snapshot";
                      mountOptions = [
                        "compress=zstd"
                        "noatime"
                        "ssd"
                        "space_cache=v2"
                        "discard=async"
                      ];
                    };
                  };
                };
              };
            };
            swap = {
              size = "100%";
              content = {
                type = "swap";
                discardPolicy = "both";
                resumeDevice = true;
                randomEncryption = true;
              };
            };
          };
        };
      };
    };
  };
}
