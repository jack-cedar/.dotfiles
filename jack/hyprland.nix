{pkgs, inputs, ...}:
{

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$editor" = "emacsclient -c -a 'emacs'";
    "$terminal" = "alacritty";
    "$launcher" = "emacsclient -e  '(emacs-app-launcher)'";
    monitor = [
      "eDP-1, disable"
                  ];
    windowrule = [
      "float, title:(emacs-run-launcher)"
      "size [120] [50], title:(emacs-run-launcher)"
    
    ];
    
    bind = [
      
      "$mod, B, exec, firefox"
        "$mod, E, exec, $editor"
        "$mod, Q, exec, $terminal"
        "$mod, F, fullscreen"
        "$mod, K, killactive"
        "$mod, L, exec, $launcher"
        
              ] ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
    
    bindm = [
      # mouse movements
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod ALT, mouse:272, resizewindow"
    ];
    input = {
      kb_layout = "us";
      kb_options = "caps:swapescape";
      
    };
        
  };
}
