{ ... }:

{
  home.sessionVariables = {
    # --- Core Programs --- #
    BAT_THEME = "ansi";
    BROWSER = "chromium";
    TERMINAL = "kitty";
    EDITOR = "nvim";
    VISUAL = "nvim";
    SUDO_EDITOR = "nvim";

    # --- Wayland & Compositor --- #
    LIBSEAT_BACKEND = "logind";
    QT_QPA_PLATFORM = "Wayland;xcb";
    QT_STYLE_OVERRIDE = "adwaita-dark";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    WLR_RENDERER = "vulkan";
    # WLR_NO_HARDWARE_CURSORS=1;
    NIXOS_OZONE_WL = "1";

    # --- Misc --- #
    MPV_IDLE_INHIBIT = "yes";
    MOZ_USE_WAYLAND_IDLE_INHIBITOR = "1";
    XCOMPOSEFILE = "$HOME/.XCompose";

  };
}
