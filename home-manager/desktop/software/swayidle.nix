{ pkgs, ... }:

{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 600;
        command = "${pkgs.swaylock-effects}/bin/swaylock -F -f -C ~/.config/swaylock/config";
      }
      {
        timeout = 660;
        command = "${pkgs.wlopm}/bin/wlopm --off '*'";
        resumeCommand = "${pkgs.wlopm}/bin/wlopm --on '*'";
      }
      {
        timeout = 7200;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
    events = {
      "before-sleep" = "${pkgs.swaylock-effects}/bin/swaylock -F -f -C ~/.config/swaylock/config";
      "lock" = "lock";
    };
  };
}
