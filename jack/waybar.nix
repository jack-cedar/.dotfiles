{} :
{
  programs.waybar = {
    enable = true;
    settings = [
      {
        modules-right = [
          "temperature"
          "memory"
          "disk"
          "tray"
          "pulseaudio"
          "network"
          "clock"
        ];
        modules-center = [
		      "custom/left-arrow-dark"
		      "clock#1"
		      "custom/left-arrow-light"
		      "custom/left-arrow-dark"
		      "clock#2"
		      "custom/right-arrow-dark"
		      "custom/right-arrow-light"
		      "clock#3"
		      "custom/right-arrow-dark"
	      ];
        
        modules-left = [
          "hyprland/workspaces"
          "custom/right-arrow-dark"
        ];
        "custom/left-arrow-dark" = {
		      "format" = "";
		      "tooltip" = false;
	      };
	      "custom/left-arrow-light" = {
		      "format" = "";
		      "tooltip" = false;
	      };
	      "custom/right-arrow-dark" = {
		      "format" = "";
		      "tooltip" = false;
	      };
	      "custom/right-arrow-light" = {
		      "format" = "";
		      "tooltip" = false;
	      };

	      "hyprland/workspaces" = {
		      "disable-scroll" = true;
		      "format" = "{name}";
	      };

	      #  clock#1 = {
		    #   "format": "{:%a}"
		    #   "tooltip": false
	      # }
	      #  clock#2  = {
		    #   "format": "{:%H:%M}"
		    #   "tooltip": false
	      # }
	      # clock#3 = {
		    #   "format": "{:%m-%d}"
		    #   "tooltip": false
	      # }

      }
    ];
  };
}
