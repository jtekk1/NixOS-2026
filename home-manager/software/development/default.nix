{ pkgs, ... }:

{
  imports = [
    ./ai-tools.nix
    ./code-editors.nix
    ./containers.nix
    ./git.nix
  ];
}
