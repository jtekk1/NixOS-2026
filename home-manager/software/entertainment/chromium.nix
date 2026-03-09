{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (chromium.override {
      proprietaryCodecs = true;
      enableWideVine = true;
      commandLineArgs = [
        "--enable-features=UseOzonePlatform,WaylandWindowDecorations,VaapiVideoDecodeLinuxGL"
        "--ozone-platform-hint=wayland"
        "--enable-wayland-ime"
        "--gtk-version=4"
      ];
    })
  ];
}
