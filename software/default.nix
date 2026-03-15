{
  isMango,
  isGaming,
  optionals,
  ...
}:

{
  imports = [
    ./obs.nix
  ]
  ++ optionals isMango [
    ./mango
  ]
  ++ optionals isGaming [
    ./gaming
  ];
}
