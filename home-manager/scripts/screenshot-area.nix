{ pkgs, ... }:

let
  screenshot-area = pkgs.writeShellScriptBin "screenshot-area" ''
    # Screenshot area selection
    # shotman properly handles input to prevent click-through issues

    if [ "$1" = "--clipboard" ]; then
      # Copy to clipboard using shotman (-C flag)
      shotman -c region -C
    elif [ -n "$1" ]; then
      # Save to specified file
      # Note: shotman doesn't support custom file paths, so we use grim as fallback
      GEOMETRY=$(slurp -b '#00000001' 2>/dev/null)
      if [ -n "$GEOMETRY" ]; then
        grim -g "$GEOMETRY" "$1"
      fi
    else
      # Save to default Pictures directory
      shotman -c region
    fi
  '';

in
{
  home.packages = with pkgs; [
    # 1. Your custom script
    screenshot-area

    # 2. The required Wayland screenshot dependencies
    shotman
    slurp
    grim
  ];
}
