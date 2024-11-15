{
  description = "NixOS Configuration";
  inputs = {
    nix-gaming.url = github:jack-cedar/nix-gaming;
    nixd.url = github:nix-community/nixd;
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
 
    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, home-manager, ... }@inputs:
    let
      inherit (nixpkgs) lib;
      hmlib = home-manager.lib;
      
      pkgs = import nixpkgs {
        inherit system;
     
        config.allowUnfree = true;
        overlays = [ (final: prev: { portmod = prev.callPackage ./overlays/portmod {}; } ) ];
      };

      system = "x86_64-linux";

    in {
      homeConfigurations = {
        jc = hmlib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./jack/home.nix ];
        };
      };
      
      nixosConfigurations = {
        laptop = lib.nixosSystem {
          modules = [
            ./systems/laptop.nix
            ./hardware-configuration.nix
          ];
        };
      };
    };
}

  

  
