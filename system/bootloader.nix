{ inputs, pkgs, ... }:

{
  boot = {

    consoleLogLevel = 0;
    initrd = {
      verbose = false;
      systemd.enable = true;
    };
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    loader = {
      limine = {
        enable = true;
        style = {
          wallpapers = [ ../assets/limine/wallpaper ];
          wallpaperStyle = "centered";
        };
        extraConfig = ''
          TIMEOUT=1
        '';
      };

      efi.canTouchEfiVariables = true;
    };

    plymouth = {
      enable = true;
      logo = "${pkgs.nixos-icons}/share/icons/hicolor/48x48/apps/nix-snowflake-white.png";
      theme = "tech_b";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [
            "darth_vader"
            "optimus"
            "tech_a"
            "tech_b"
          ];
        })
        inputs.nix-bloom.packages.${pkgs.system}.default
      ];
    };
  };
}
