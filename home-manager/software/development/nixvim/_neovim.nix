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
    source = ./../../../assets/nvim;
    recursive = true;
  };
}
