{
  hostname,
  ...
}:

let

  monitorRules = {
    deepspace = ''
      # Main ultrawide monitor - 40% master
      monitorrule=name:DP-1,width:5120,height:2160,refresh:120,x:0,y:0,scale:1.2,vrr:1,rr:0

      # Projector (disabled by default, enabled via keybind)
      monitorrule=name:HDMI-A-2,width:1920,height:1080,refresh:60,x:4266,y:0,scale:1,vrr:1,rr:0
    '';

    thinkpad = ''
      # Monitor rules (set default layouts)
      # name,mfact,nmaster,layout,transform,scale,x,y,width,height,refreshrate

      # Laptop internal display - 55% master
      monitorrule=name:eDP-1,width:1920,height:1080,refresh:60,x:0,y:1080,scale:1.0,vrr:1,rr:0

      # External ultrawide (docked) - 40% master
      monitorrule=name:HDMI-A-2,width:2560,height:1080,refresh:60,x:0,y:0,scale:1.0,vrr:1,rr:0
      monitorrule=name:DP-1,width:1920,height:1080,refresh:60,x:0,y:0,scale:1.0,vrr:1,rr:0
      monitorrule=name:DP-2,width:1920,height:1080,refresh:60,x:0,y:0,scale:1.0,vrr:1,rr:0

    '';
  };

  defaultRules = ''
    # Default monitor rule
    monitorrule=name:*,width:1920,height:1080,refresh:60,x:0,y:0,scale:1.0,vrr:1,rr:0
  '';
in
{
  wayland.windowManager.mango.settings = monitorRules.${hostname} or defaultRules;
}
