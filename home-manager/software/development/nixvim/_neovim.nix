{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      nodejs_22
      ripgrep
      fd
      lazygit
      gcc
    ];
  };

  xdg.configFile."nvim" = {
    source = ./../../../dots/nvim;
    recursive = true;
  };
}
