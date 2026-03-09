{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cargo
    gcc
    go
    lua53Packages.luarocks
    luarocks
    nodejs
    python3
    ruby
    rustc
    rustup
    uv

    nixd
    nixfmt
  ];
}
