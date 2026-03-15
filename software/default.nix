{
  nixpkgsLibs,
  hostname,
  desktopEnvironment,
  ...
}:

let
  lib = nixpkgsLibs;
  isMango = if desktopEnvironment == "mango" then true else false;
  isGaming = if hostname == "deepspace" then true else false;

in
{
  imports = [
    ./obs.nix
  ]
  ++ lib.optionals isMango [
    ./mango
  ]
  ++ lib.optionals isGaming [
    ./gaming
  ];
}
