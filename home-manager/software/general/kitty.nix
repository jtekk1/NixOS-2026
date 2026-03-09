{ ... }:

{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    #themeFile = "SyntWave84_Python";
    #themeFile = "Dracula";
    shellIntegration.enableBashIntegration = true;
    settings = {
      include = "~/.config/kitty/colors.conf";
      # --- FONT --- #
      font_family = "CaskaydiaCove Nerd Font Propo";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 10;

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
