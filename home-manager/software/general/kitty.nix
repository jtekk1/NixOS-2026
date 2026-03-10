{ ... }:

{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableBashIntegration = true;
    settings = {

      # --- Fonts --- #
      include = "~/.config/kitty/colors.conf";
      font_family = "CaskaydiaCove Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 10;
      symbol_map = "U+23FB-U+23FE,U+2B58,U+E200-U+E2A9,U+E0A0-U+E0A3,U+E0B0-U+E0BF,U+E0C0-U+E0C8,U+E0CC-U+E0CF,U+E0D0-U+E0D2,U+E0D4,U+E700-U+E7C5,U+F000-U+F2E0,U+2665,U+26A1,U+F400-U+F4A8,U+F67C,U+E000-U+E00A,U+F300-U+F313,U+E5FA-U+E62B CaskaydiaCove Nerd Font";

      # --- CURSOR --- #
      cursor_shape = "block";
      cursor_shape_unfocused = "hollow";
      cursor_beam_thickness = 1.5;
      cursor_underline_thickness = 2.0;
      cursor_blink_interval = 1;
      cursor_stop_blinking_after = 60.0;
      cursor_trail = 5;
      cursor_trail_decay = "0.1 0.5";
      cursor_trail_start_threshold = 2;

      # --- SCROLLBACK --- #
      scrollback_lines = 2000;
      scrollbar = "scrolled";
      scrollbar_interactive = true;
      scrollbar_width = 0.5;
      scrollbar_hover_width = 1;
      scrollbar_radius = 0.3;
      scrollbar_gap = 0.1;
      scrollbar_min_handle_height = 1;
      scrollbar_hitbox_expansion = 0.25;
      scrollbar_track_opacity = 0;
      scrollbar_track_hover_opacity = 0.1;
      scrollbar_handle_color = "foreground";
      scrollbar_track_color = "foreground";
      scrollback_pager_history_size = 0;

      # --- URLS --- #
      url_style = "curly";
      open_url_with = "default";
      url_prefixes = "file ftp ftps gemini git gopher http https irc ircs kitty mailto news sftp ssh";
      detect_urls = true;
      show_hyperlink_targets = true;
      underline_hyperlinks = "hover";

      # --- Terminal Bell --- #
      enable_audio_bell = true;
      visual_bell_duration = 1.0;
      visual_bell_color = "none";
      window_alert_on_bell = true;
      bell_on_tab = "🔔 ";

      # --- Linux --- #
      wayland_titlebar_color = "system";
      linux_display_server = "wayland";
      wayland_enable_ime = true;
    };
  };
}
