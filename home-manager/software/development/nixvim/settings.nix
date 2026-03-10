{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals.mapleader = " ";
    globals.maplocalleader = "\\";

    opts = {
      number = true;
      relativenumber = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      ignorecase = true;
      smartcase = true;
      cursorline = true;
      termguicolors = true;
      signcolumn = "yes";
      updatetime = 200;
      timeoutlen = 300;
      clipboard = "unnamedplus"; # System clipboard
      undofile = true; # Persistent undo
    };
  };
}
