{
  description = "NixOS Configuration";
  inputs = {
    nix-gaming.url = github:fufexan/nix-gaming;
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    home-manager.url = github:nix-community/home-manager;
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, home-manager, ... }@inputs:
    let
      inherit (nixpkgs) lib;
      hmlib = home-manager.lib;
      
      #systems = import ./systems { inherit pkgs lib; };

     
      
     # inherit (systems) laptop;
      
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [];
      };

      system = "x86_64-linux";

    in {
      homeConfigurations = {
        jc = hmlib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
        #  username = "jack";
        #  homeDirectory = "/home/jack";
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

  

  
