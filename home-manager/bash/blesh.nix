{ pkgs, ... }:

{
  home.packages = [ pkgs.blesh ];

  programs.bash = {
    enable = true;
    initExtra = ''
      source ${pkgs.blesh}/share/blesh/ble.sh
      ble-import integration/fzf-completion
      ble-import integration/fzf-key-bindings
    '';
  };
}
