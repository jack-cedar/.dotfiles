{config, lib, pkgs, ... }:
{
  imports = [ ../base-system.nix ];
  powerManagement.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
 
  services.mullvad-vpn.enable = true;
  programs.noisetorch.enable = true;
  virtualisation.podman.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nix.optimise.automatic = true;

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };


  hardware.opentabletdriver.enable = true;
  services.flatpak.enable = true;

  #services.guix.enable = true;

  # hardware.yeetmouse = {
  #   enable = true;
  #   parameters = {
  #    ScrollsPerTick = 3;
  #   };
  # };
  
  fonts.packages = with pkgs; [iosevka-comfy.comfy
                               (nerdfonts.override { fonts = ["Iosevka"]; })
                              ];

  programs.java.enable = true;




  programs.steam.enable = true;
  
  programs.hyprland.enable = true;
  services.displayManager = {
    defaultSession = "hyprland";
  };
 
 services.displayManager.sddm.enable = true;
 services.displayManager.sddm.wayland.enable = true;
 # services.displayManager..enable = true;
  
 services.desktopManager.plasma6.enable = true;

  services.xserver = {
  #  xkb.layout = "us";
  #  xkb.variant = "";
    xkb.options = "caps:escape";
    enable = true;
    
    displayManager.sddm.enable = true;
    displayManager.sddm.wayland.enable = true;
   
  
     # desktopManager =
     #  {
     #  session = [ {
     #    manage = "desktop";
     #    name = "exwm";
     #   start = ''
     #    unset XDG_CURRENT_DESKTOP
     #    unset DESKTOP_SESSION
     #    export XMODIFIERS="@im=fcitx5"
     #    export XMODIFIER="@im=fcitx5"
     #    export GTK_IM_MODULE="fcitx5"
     #    export  QT_IM_MODULE="fcitx5"
     #    fcitx5 &
        
     #    wmname LG3D 
     #    export _JAVA_AWT_WM_NONREPARENTING=1
  
     #    ${pkgs.emacs}/bin/emacs &
     #    waitPID=$! '';
     #  } ];
     #  };


  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
      ];
    };
  };
  
}
