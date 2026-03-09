{ pkgs, ... }:

let
  wofi-theme-switcher = pkgs.writeShellScriptBin "wofi-theme-switcher" ''
    # --- CONFIGURATION ---
    THEME_DIR="$HOME/.config/ThemeSwitcher"
    COLOR_DIR="$THEME_DIR/color-themes"
    WALL_ROOT="$HOME/tekk-wallpapers"

    # --- GENERATE MENU ---
    generate_menu() {
      for theme in "$COLOR_DIR"/*.toml; do
        [ -e "$theme" ] || continue

        # Extract wallpaper path
        relative_path=$(grep "WALLPAPER" "$theme" | cut -d '=' -f 2 | tr -d '"[:space:]')
        
        # Nix escaping required here for the curly braces!
        full_img_path="''${WALL_ROOT}''${relative_path}"

        if [ ! -f "$full_img_path" ]; then
          continue
        fi

        # JUST send the image. We don't care about attaching text anymore.
        printf "img:%s\n" "$full_img_path"
      done
    }

    # --- RUN WOFI ---
    selected=$(generate_menu | wofi --show dmenu \
      --prompt "Select Theme" \
      --style "$HOME/.config/wofi/style.css" \
      --allow-images \
      --allow-markup \
      --insensitive \
      --cache-file /dev/null \
      --columns 3 \
      --lines 2 \
      --width 50% \
      --define "image_size=600" 2>/dev/null)

    # --- HANDLE SELECTION ---
    if [ -n "$selected" ]; then
      # 1. Clean the output (Remove 'img:' prefix)
      # Nix escaping required here!
      clean_image_path="''${selected#img:}"

      # 2. Extract just the filename of the image (e.g., "chimera4.jpeg")
      image_filename=$(basename "$clean_image_path")

      echo "DEBUG: Looking for theme containing image: $image_filename"

      # 3. REVERSE LOOKUP: Find the TOML file that contains this image
      found_theme_path=$(grep -l "$image_filename" "$COLOR_DIR"/*.toml | head -n 1)

      if [ -n "$found_theme_path" ]; then
        final_theme=$(basename "$found_theme_path")

        echo "Selected Theme: $final_theme"
        cd "$THEME_DIR"
        
        # Execute the python script
        python3 "$THEME_DIR/theme_switcher.py" "$final_theme" >/tmp/theme-switcher.log 2>&1
        notify-send "Wallpaper Changed" "$final_theme"

      else
        echo "Error: Could not find a theme that uses this image."
        notify-send "Error" "Theme lookup failed for image."
      fi
    fi
  '';

in
{
  home.packages = with pkgs; [
    # 1. Your custom script
    wofi-theme-switcher

    # 2. Strict dependencies
    wofi
    libnotify # For notify-send
    python3 # Required to execute theme_switcher.py
  ];
}
