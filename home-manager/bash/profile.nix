{ ... }:

{
  services.ssh-agent.enable = true;
  programs.bash = {
    enable = true;

    # profileExtra executes only on login (perfect for starting a Wayland session)
    profileExtra = ''
      # Auto-start Mango compositor strictly on tty1 for the Thinkpad
      if [[ -z $DISPLAY && $(tty) == /dev/tty1 && "$HOSTNAME" == "thinkpad" ]]; then
        exec dbus-run-session mango
      fi
    '';
  };
}
