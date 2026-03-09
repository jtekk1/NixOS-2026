{ pkgs, ... }:

{
  home.packages = with pkgs; [
    curlFull
    fastfetch
    jq
    killall
    lsof
    plocate
    rsync
    tldr
    wget
    wlr-randr
    xstow
    zip
  ];
}
