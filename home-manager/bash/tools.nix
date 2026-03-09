{ lib, pkgs, ... }:

let
  integratedShellTools = [
    "atuin"
    "eza"
    "fzf"
    "yazi"
    "zoxide"
  ];

in
{
  programs = lib.mkMerge [
    (lib.listToAttrs (
      map (name: {
        name = name;
        value = {
          enable = true;
          enableBashIntegration = true;
        };
      }) integratedShellTools
    ))

    {
      starship.enable = true;
      eza = {
        git = true;
        icons = "auto";
      };

      fzf = {
        defaultCommand = "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git";
        defaultOptions = [
          "--height 40%"
          "--layout=reverse"
          "--border"
        ];
        fileWidgetCommand = "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git";
        changeDirWidgetCommand = "fd --type d --strip-cwd-prefix --hidden --follow --exclude .git";
      };
    }
  ];

  home.packages = with pkgs; [
    bat
    fd
    ripgrep
  ];
}
