{ pkgs, ... }:

{
  # --- XDG User Directories --- #
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    desktop = "$HOME/Desktop";
    documents = "$HOME/Documents";
    download = "$HOME/Downloads";
    music = "$HOME/Music";
    pictures = "$HOME/Pictures";
    publicShare = "$HOME/Public";
    templates = "$HOME/Templates";
    videos = "$HOME/Videos";
  };

  # --- XDG User Directories --- #
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # Web (Vivaldi)
      "text/html" = [ "chromium.desktop" ];
      "x-scheme-handler/http" = [ "chromium.desktop" ];
      "x-scheme-handler/https" = [ "chromium.desktop" ];
      "x-scheme-handler/about" = [ "chromium.desktop" ];
      "x-scheme-handler/unknown" = [ "chromium.desktop" ];

      # Documents (Zathura)
      "application/pdf" = [ "org.pwmt.zathura.desktop" ];

      # Text & Code (Neovim)
      "text/plain" = [ "nvim.desktop" ];
      "text/markdown" = [ "nvim.desktop" ];
      "text/x-markdown" = [ "nvim.desktop" ];

      # Images (Satty)
      "image/png" = [ "satty.desktop" ];
      "image/jpeg" = [ "satty.desktop" ];
      "image/jpg" = [ "satty.desktop" ];
      "image/gif" = [ "satty.desktop" ];
      "image/svg+xml" = [ "satty.desktop" ];
      "image/webp" = [ "satty.desktop" ];

      # Media (MPV)
      "video/mp4" = [ "mpv.desktop" ];
      "video/x-matroska" = [ "mpv.desktop" ];
      "video/webm" = [ "mpv.desktop" ];
      "audio/mpeg" = [ "mpv.desktop" ];
      "audio/x-wav" = [ "mpv.desktop" ];
      "audio/flac" = [ "mpv.desktop" ];

      # Directories (Yazi)
      "inode/directory" = [ "yazi.desktop" ];

      # Terminal (Kitty)
      "application/x-terminal-emulator" = [ "kitty.desktop" ];

      # Chat (Vesktop / Discord URIs)
      "x-scheme-handler/discord" = [ "vesktop.desktop" ];
    };
  };

  xdg.desktopEntries = {
    # Wraps Neovim to open inside a new Kitty window
    nvim = {
      name = "Neovim";
      genericName = "Text Editor";
      exec = "kitty -- nvim %F";
      terminal = false;
      categories = [
        "Development"
        "TextEditor"
      ];
      mimeType = [
        "text/plain"
        "text/x-markdown"
      ];
      icon = "nvim";
    };

    # Wraps Yazi to open inside a new Kitty window when a folder is clicked
    yazi = {
      name = "Yazi";
      genericName = "File Manager";
      exec = "kitty -- yazi %U";
      terminal = false;
      categories = [
        "System"
        "FileTools"
        "FileManager"
      ];
      mimeType = [ "inode/directory" ];
      icon = "yazi";
    };

    # Basic Kitty entry
    kitty = {
      name = "Kitty";
      genericName = "Terminal Emulator";
      exec = "kitty %u";
      terminal = false;
      categories = [
        "System"
        "TerminalEmulator"
      ];
      icon = "kitty";
    };
  };
}
