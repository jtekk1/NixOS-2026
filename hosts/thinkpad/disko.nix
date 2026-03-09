{ ... }:

{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-WDC_PC_SN720_SDAQNTW-512G-1001_183904800036";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              name = "ESP";
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
            swap = {
              size = "4G";
              content = {
                type = "swap";
                randomEncryption = true;
                resumeDevice = false;
              };
            };
            root = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypt-root";
                settings = {
                  allowDiscards = true;
                };
                content = {
                  type = "filesystem";
                  format = "xfs";
                  mountpoint = "/";
                  extraArgs = [
                    "-f"
                    "-L"
                    "NIXOS-ROOT"
                  ];
                };
              };
            };
          };
        };
      };
    };
  };
}
