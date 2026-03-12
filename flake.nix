{
  description = "Jtekk's not-so-awesome Flake Config";

  inputs = {

    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nixpkgs-stable = {
      url = "github:NixOS/nixpkgs/nixos-25.11";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mango = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-bloom = {
      url = "github:FirPic/nix-bloom";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      disko,
      home-manager,
      mango,
      nixos-hardware,
      nixpkgs,
      nixvim,
      ...
    }@inputs:

    let

      mkDesktop =
        { hostname }:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [
            disko.nixosModules.disko
            ./system
            ./hosts/${hostname}/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs hostname; };
              home-manager.users.jtekk = import ./home-manager;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };

    in
    {
      nixosConfigurations = {
        "deepspace" = mkDesktop { hostname = "deepspace"; };
        "thinkpad" = mkDesktop { hostname = "thinkpad"; };
      };
    };
}
