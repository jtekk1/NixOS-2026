{ ... }:

{
  # Map the contents of dot-icons into ~/.icons/
  home.file.".icons" = {
    # CRUCIAL: Use relative paths based on where this .nix file lives!
    # For example, if this is in ~/NixOS/home.nix, use ./assets/dot-icons
    source = ./../../assets/icons/dot-icons;
    recursive = true;
  };

  # Map the contents of local-share-icons into ~/.local/share/icons/
  home.file.".local/share/icons" = {
    source = ./../../assets/icons/local-share-icons;
    recursive = true;
  };
}
