{config, lib, pkgs, ... }:
{
  imports = [ ./base-system.nix ];
  powerManagement.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  #xdg.portal.enable = true;
  #services.flatpak.enable = true;
 
  services.mullvad-vpn.enable = true;
  programs.noisetorch.enable = true;
  virtualisation.podman.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nix.optimise.automatic = true;

  services.guix.enable = true;
 
  services.hydra = {
    enable = true;
    hydraURL = "http://localhost:3000";
    notificationSender = "hydra@localhost";
    buildMachinesFiles = [];
    useSubstitutes = true;
  };
  
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];};
    
  fonts.packages = with pkgs; [iosevka-comfy.comfy
                               (nerdfonts.override { fonts = ["Iosevka"]; })
                              ];

  programs.java.enable = true; 
 


  programs.steam.enable = true;
 

  
  services.xserver = {
    layout = "us";
    xkbVariant = "";
    xkbOptions = "caps:escape";
    enable = true;
  
    displayManager = {
     lightdm.enable = true;
     defaultSession = "exwm";
    };

   
    desktopManager = {
      session = [ {
        manage = "desktop";
        name = "exwm";
        start = ''
        unset XDG_CURRENT_DESKTOP
        unset DESKTOP_SESSION
        export XMODIFIERS="@im=fcitx5"
        export XMODIFIER="@im=fcitx5"
        export GTK_IM_MODULE="fcitx5"
        export  QT_IM_MODULE="fcitx5"
        fcitx5 &
        
        wmname LG3D 
        export _JAVA_AWT_WM_NONREPARENTING=1
  
        ${pkgs.emacs29}/bin/emacs &
        waitPID=$! '';
      } ];
    }; };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };
  
}
