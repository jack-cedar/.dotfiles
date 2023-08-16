{ pkgs, inputs, ... }:

{
  home.username = "jack";
  home.homeDirectory = "/home/jack";

  home.stateVersion = "22.11";
  services.picom.enable = true;


  programs.go.enable = true;

  home.packages = import ./manifest.nix {inherit pkgs inputs;};
  
  fonts.fontconfig.enable = true;
 

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
