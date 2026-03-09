{ pkgs, ... }:

{
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  services.pipewire.wireplumber.enable = true;

 }
