{ pkgs, inputs, ... }:
{
  home.username = "jack";
  home.homeDirectory = "/home/jack";

 
  home.stateVersion = "22.11";

  services.picom.enable = true;



 
  services.polybar.enable = true;
  services.polybar.config = {
    "bar/top" = {
      monitor = "eDP-1";
      modules-right = "date battery";
      font-0 = "Iosevka Nerd Font:pixelsize=15;1";
    };

    "module/date" = {
      type = "internal/date";
      interval = 5;
      
      time = "%H:%M";
      date = "%b %d (%a)";
      label = " %time% |  %date%";
        
    };
    "module/battery" = {
      ramp-capacity-0 = "";
      ramp-capacity-1 = "";
      ramp-capacity-2 = "";
      ramp-capacity-3 = "";
      ramp-capacity-4 = "";

      label-discharging = " %percentage%%";
      label-charging = "󱐋 %percentage%%";
      label-low = "! %percentage%%";

      
      format-discharging = "<ramp-capacity> <label-discharging>";
      format-charging = "<ramp-capacity> <label-charging>";
      format-low = "<ramp-capacity> <label-low>";
        
      
      type = "internal/battery";
      battery = "BAT1";
      adapter = "ADP1";
      format-full = "";
      full-at = 98;
    };

  };
  services.polybar.script = "polybar top &";

  programs.go.enable = true;

  home.packages = import ./manifest.nix {inherit pkgs inputs;};
  
  fonts.fontconfig.enable = true;
 

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
