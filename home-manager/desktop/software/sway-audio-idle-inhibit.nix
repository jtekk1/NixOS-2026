{ pkgs, ... }:

{
  systemd.user.services."sway-audio-idle-inhibit" = {
    Unit = {
      Description = "Sway-audio-idle-inhibit to help with inhibitting idle/lock.";
      Requires = [ "mango-session.target" ];
      After = [ "mango-session.target" ];
    };

    Install = {
      WantedBy = [ "mango-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.sway-audio-idle-inhibit}/bin/sway-audio-idle-inhibit";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
}
