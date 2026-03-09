{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "JTekk";
        email = "joaquin@jtekk.dev";
      };
      init = {
        defaultBranch = "main";
      };
    };
    ignores = [
      "CLAUDE.md"
      "CLAUDE.local.md"
      "_plans/"
    ];
  };
  home.packages = with pkgs; [
    gh
    lazygit
    tea
  ];
}
