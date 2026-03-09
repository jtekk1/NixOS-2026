{ pkgs, ... }:

let
  # 1. We define the script as a variable using writeShellScriptBin
  layout-notify = pkgs.writeShellScriptBin "layout-notify" ''
    case $1 in
      centerTiling)
        MODE="CENTER TILING"
        mmsg -l CT
        ;;
      deck)
        MODE="DECK"
        mmsg -l K
        ;;
      grid)
        MODE="GRID"
        mmsg -l G
        ;;
      monocle)
        MODE="MONOCLE"
        mmsg -l M
        ;;
      rightTiling)
        MODE="RIGHT TILING"
        mmsg -l RT
        ;;
      scrolling)
        MODE="SCROLLING"
        mmsg -l S
        ;;
      tgmix)
        MODE="TGMIX"
        mmsg -l TG
        ;;
      tiling)
        MODE="TILING"
        mmsg -l T
        ;;
      verticalDeck)
        MODE="VERTICAL DECK"
        mmsg -l VK
        ;;
      verticalGrid)
        MODE="VERTICAL GRID"
        mmsg -l VG
        ;;
      veritcalScrolling) # Note: You have a typo here ("veritcal") from your original script!
        MODE="VERTICAL SCROLLING"
        mmsg -l VS
        ;;
      verticalTiling)
        MODE="VERTICAL TILING"
        mmsg -l VT
        ;;
      *)
        exit 1
        ;;
    esac

    # It's best practice to call the exact binary path in Nix, 
    # but relying on your $PATH works fine too as long as swayosd is installed!
    swayosd-client --custom-message ">>> $MODE <<<"
  '';

in
{
  home.packages = [
    layout-notify

    pkgs.swayosd
  ];
}
