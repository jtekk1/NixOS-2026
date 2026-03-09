{ pkgs, ... }:

let
  wofi-clipboard-menu = pkgs.writeShellScriptBin "wofi-clipboard-menu" ''
    # Get clipboard history from cliphist
    selected=$(cliphist list | wofi --dmenu --prompt="Clipboard" --lines=15)

    # If something was selected, decode and copy it
    if [ -n "$selected" ]; then
        echo "$selected" | cliphist decode | wl-copy
    fi
  '';

in
{
  # 1. Enable the background daemon so it actually records your clipboard
  services.cliphist.enable = true;

  home.packages = with pkgs; [
    # 2. Your custom script
    wofi-clipboard-menu
    
    # 3. Strict dependencies
    cliphist
    wofi
    wl-clipboard # Provides wl-copy
  ];
}
