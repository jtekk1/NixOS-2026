{ ... }:

{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "lock";
        "action" = "swaylock -C /home/jtekk/.config/swaylock/config";
        "text" = "  Lock   ";
        "keybind" = "l";
      }

      {
        "label" = "logout";
        "action" = "loginctl terminate-user $USER";
        "text" = " Logout  ";
        "keybind" = "m";
      }

      {
        "label" = "shutdown";
        "action" = "loginctl poweroff";
        "text" = "Shutdown ";
        "keybind" = "d";
      }

      {
        "label" = "reboot";
        "action" = "loginctl reboot";
        "text" = " Reboot  ";
        "keybind" = "r";
      }

      {
        "label" = "suspend";
        "action" = "loginctl suspend";
        "text" = " Suspend ";
        "keybind" = "s";
      }

      {
        "label" = "hibernate";
        "action" = "loginctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }
    ];

    style = ''
      window {
          font-family: HYLeMiaoTiJ,CaskaydiaCove Nerd Font, monospace;
          font-size: 12pt;
          font-weight: bold;
          color: #7ba7d1;
          background-color: rgba(10,10,15,1.000000);
      }

      button {
          background-repeat: no-repeat;
          background-position: center;
          font-size: 40px;
          background-size: 60%;
          color: #e8f4fd;
          text-shadow: 0 0 8px rgba(123,167,209,0.600000);
      }

      button:hover {
          background-size: 80%;
          color: #e8f4fd;
          text-shadow: 0 0 12px rgba(37,150,190,0.800000);
          box-shadow: 0 0 25px rgba(37,150,190,0.500000);
          transition: all 0.3s cubic-bezier(.55, 0.0, .28, 1.682), box-shadow 0.5s ease-in;
      }

      #lock {
          background-image: image(url("/home/jtekk/NixOS/assets/wlogout/lock.png"));
      }

      #logout {
          background-image: image(url("/home/jtekk/NixOS/assets/wlogout/logout.png"));
      }

      #logout:hover {
          background-image: image(url("/home/jtekk/NixOS/assets/wlogout/logout.png"));
      }

      #suspend {
          background-image: image(url("/home/jtekk/NixOS/assets/wlogout/sleep.png"));
      }

      #shutdown {
          background-image: image(url("/home/jtekk/NixOS/assets/wlogout/power.png"));
      }

      #reboot {
          background-image: image(url("/home/jtekk/NixOS/assets/wlogout/restart.png"));
      }

      #hibernate {
          background-image: image(url("/home/jtekk/NixOS/assets/wlogout/hibernate.png"));
      }
    '';
  };
}
