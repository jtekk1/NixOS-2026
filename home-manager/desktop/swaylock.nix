{ pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {

      # --- Background & Image ---
      image = "/home/jtekk/tekk-wallpapers/NixOS/nix-glow-black.png";
      effect-blur = "3x10"; # <-- Disabled to keep the neon glow sharp
      effect-vignette = "0.5:0.5";
      color = "#000000"; # Pure black fallback
      fade-in = "0.200000";

      # --- Font & Text ---
      font = "CaskaydiaMono Nerd Font";
      font-size = "24";
      clock = true;
      timestr = "%H:%M";
      datestr = "%a, %b %d";
      text-color = "#FFFFFF";
      text-clear-color = "#FFFFFF";
      text-ver-color = "#FFFFFF";
      text-wrong-color = "#FF4B4B"; # Neon red on failure

      # --- Indicator Ring ---
      indicator = true;
      indicator-radius = "100";
      indicator-thickness = "7";
      separator-color = "00000000"; # Transparent

      # --- Inside Colors (The center of the ring) ---
      # Using a very dark gray/black so it blends into the wallpaper
      inside-color = "#050505";
      inside-clear-color = "#050505";
      inside-ver-color = "#050505";
      inside-wrong-color = "#050505";

      # --- Ring Colors (The outer border) ---
      ring-color = "#111111"; # Barely visible dark ring when idle
      ring-clear-color = "#FFFFFF"; # White when clearing
      ring-ver-color = "#7BD8FF"; # Neon cyan (matches the logo glow) when checking
      ring-wrong-color = "#FF4B4B"; # Neon red when auth fails

      # --- Highlight Colors (The typing indicator) ---
      key-hl-color = "#7BD8FF"; # Neon cyan chunk appears as you type
      bs-hl-color = "#FF4B4B"; # Neon red chunk appears when you backspace

      # --- Line Colors (Border between inside and ring) ---
      line-color = "00000000";
      line-clear-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";

      # --- Grace Period ---
      grace = "2";
      grace-no-mouse = true;
      grace-no-touch = true;
    };
  };
}
