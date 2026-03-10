{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      # Noto fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      dina-font
      proggyfonts

      # Nerd fonts (programming fonts with icons)
      nerd-fonts.caskaydia-mono
      nerd-fonts.caskaydia-cove
      nerd-fonts.zed-mono
      nerd-fonts.roboto-mono
      nerd-fonts.jetbrains-mono
      nerd-fonts.daddy-time-mono
      nerd-fonts.fira-code
      nerd-fonts.droid-sans-mono

      #X11 fonts
      font-misc-misc
      font-adobe-100dpi
      font-adobe-75dpi

      # Icon fonts
      font-awesome
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          "Noto Serif"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Color Emoji"
        ];
        monospace = [
          "CaskaydiaCove Nerd Font Mono"
          "Noto Color Emoji"
        ];
      };
    };
  };
}
