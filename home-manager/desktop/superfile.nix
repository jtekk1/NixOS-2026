{ pkgs, ... }:

{
  programs.superfile = {
    enable = true;
    zoxidePackage = pkgs.zoxide;
    metadataPackage = pkgs.exiftool;
    settings = {
      transparent_background = true;
      metadata = true;
      enable_md5_checksum = true;
      zoxide_support = true;
    };
  };
}
