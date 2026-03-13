{ ... }:

{
  services.kanshi = {
    enable = true;
    systemdTarget = "mango-session.target";

    # settings is now a strictly ordered list of directives
    settings = [
      {
        profile = {
          name = "home";
          outputs = [
            {
              criteria = "DP-1";
              status = "enable";
            }
            {
              criteria = "HDMI-A-2";
              status = "disable";
            }
          ];
        };
      }
      {
        profile = {
          name = "laptop";
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
            }
          ];
        };
      }
      {
        profile = {
          name = "laptop-home";
          outputs = [
            {
              criteria = "eDP-1";
              status = "disable";
            }
            {
              criteria = "HDMI-A-2";
              status = "enable";
            }
          ];
        };
      }
      {
        profile = {
          name = "laptop-work";
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
            }
            {
              criteria = "DP-2";
              status = "enable";
            }
          ];
        };
      }
    ];
  };
}
