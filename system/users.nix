{ pkgs, ... }:

{
  users.users.jtekk = {
    isNormalUser = true;
    extraGroups = [ 
      "audio"
      "input"
      "render"
      "seat"
      "video"
      "wheel" 
    ];
    shell = pkgs.bash;
  };
}
