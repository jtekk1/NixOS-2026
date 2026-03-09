{ ... }:

{
  # Map the contents of dot-icons into ~/.icons/
  home.file.".icons" = {
    # CRUCIAL: Use relative paths based on where this .nix file lives!
    # For example, if this is in ~/NixOS/home.nix, use ./dots/dot-icons
    source = ./../../dots/icons/dot-icons;
    recursive = true;
  };

  # Map the contents of local-share-icons into ~/.local/share/icons/
  home.file.".local/share/icons" = {
    source = ./../../dots/icons/local-share-icons;
    recursive = true;
  };
}
