{ pkgs, ... }:

{
  home.packages = with pkgs; [
    claude-code
    gemini-cli
    crush
    opencode
  ];
}
