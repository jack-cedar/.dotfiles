
{
  description = "my home manager config";
  
  inputs = {
    nix-gaming.url = github:fufexan/nix-gaming;
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
    nixgl.url = github:guibou/nixGL;
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
      
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { nixpkgs, home-manager, nixgl, hyprland, ... }@inputs:
     let
       system = "x86_64-linux";
       pkgs = import nixpkgs {
         inherit system;
         config = { allowUnfreePredicate = pkg: true;};
         overlays = [ nixgl.overlay];
       };
    
      in {
      homeConfigurations.jack = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
      
        extraSpecialArgs = { inherit inputs; };
        modules = [
            # hyprland.homeManagerModules.default
            # {wayland.windowManager.hyprland.enable = true;}
      
          ./home.nix ];

      
      };
    };
}
