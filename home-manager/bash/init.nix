{ pkgs, ... }:

{
  # 1. Starts exactly one SSH Agent for your entire desktop session
  services.ssh-agent.enable = true;

  programs.bash = {
    # 2. Inject ble.sh at the very end of your interactive shell startup
    initExtra = ''
      source ${pkgs.blesh}/share/blesh/ble.sh
      ble-import integration/fzf-completion
      ble-import integration/fzf-key-bindings
    '';
  };
}
