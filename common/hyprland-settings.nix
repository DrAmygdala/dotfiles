{ pkgs }:
{
	enable = true;
    settings = {
        "$mod" = "SUPER";
        exec = [
            "waybar"
        ];
        monitor = [
            "eDP-1, 2256x1504@60, auto, 1.6"
            ", preferred, auto, 1"
        ];
        general = {
            gaps_in = 0;
            gaps_out = 0;
        };
        bind =
          [
            "$mod, S, exec, alacritty"
            "$mod, SPACE, exec, ${pkgs.fuzzel}/bin/fuzzel"
            "$mod, W, exec, ${pkgs.wlogout}/bin/wlogout"
            "$mod, Q, killactive"

            # Move focus
            "ALT, H, movefocus, l"
            "ALT, J, movefocus, d"
            "ALT, K, movefocus, u"
            "ALT, L, movefocus, r"

            # Move workspace
            "$mod CTRL, L, workspace, e+1"
            "$mod CTRL, H, workspace, e-1"

            # Move window
            "SUPER, H, movewindow, l"
            "SUPER, J, movewindow, d"
            "SUPER, K, movewindow, u"
            "SUPER, L, movewindow, r"

            # Switch window
            "SUPER, Tab, cyclenext"
            "SHIFT SUPER, Tab, cyclenext, prev"
            "ALT, Tab, workspace, previous" # Cycle recent workspaces

            # Resize window
            "CTRL ALT, H, resizeactive, -240 0"
            "CTRL ALT, L, resizeactive, 180 0"
            "CTRL ALT, K, resizeactive, 0 -240"
            "CTRL ALT, J, resizeactive, 0 180"

            "CTRL $mod, J, togglesplit"

            # Brightness
            "$mod, Up, exec, brightnessctl set 5%+"
            "$mod, Down, exec, brightnessctl set 5%-"
          ]
          ++ (
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
          bindm =
            [
            # Move/Resize windows with SUPER LMB/RMB and dragging
            "SUPER, mouse:272, movewindow"
            "SUPER, mouse:273, resizewindow"
            ];
    };
}
