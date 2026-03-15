{ pkgs, ... }:

{
  # Enable greetd display manager with tuigreet
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings = {
      default_session = {
        command =
          "${pkgs.tuigreet}/bin/tuigreet -tr --remember-session -s /run/current-system/sw/share/wayland-sessions --asterisks -g '!!! Welcome To NixOS !!!'";
        user = "greeter";
      };
    };
  };
  environment.systemPackages = [ pkgs.tuigreet ];
}
