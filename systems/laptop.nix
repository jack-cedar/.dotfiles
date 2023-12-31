{config, lib, pkgs, ... }:
{
  imports = [ ./base-system.nix ];
  powerManagement.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];};
    
  fonts.packages = with pkgs; [iosevka];	
    
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
