{ pkgs }:
{
    enable = true;
    plugins = with pkgs.hyprlandPlugins; [
        hy3
    ];
    settings = {
        "$mod" = "SUPER";
        exec-once = [
            "waybar"
            "nm-applet --indicator"
        ];
        monitor = [
            "eDP-1, 2256x1504@60, auto, 1.6"
            ", preferred, auto, 1"
        ];
        general = {
            gaps_in = 0;
            gaps_out = 0;
            layout = "hy3";
        };
        plugin = {
            hy3 = {
                autotile = {
                    enable = true;
                    trigger_width = 800;
                    trigger_height = 500;
                };
            };
        };
        binde = [
            # Brightness
            ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
            ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

            # Volume
            ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%-"

        ];
        bind =
          [
            "$mod, S, exec, alacritty"
            "$mod, SPACE, exec, ${pkgs.fuzzel}/bin/fuzzel"
            "$mod, W, exec, ${pkgs.wlogout}/bin/wlogout"
            "$mod, Q, killactive"

            # Hyprland test
            "ALT, z, hy3:makegroup, tab, toggle"

            # Move focus
            "ALT, H, hy3:movefocus, l, visible, warp"
            "ALT, J, hy3:movefocus, d, visible, warp"
            "ALT, K, hy3:movefocus, u, visible, warp"
            "ALT, L, hy3:movefocus, r, visible, warp"
            "ALT + SHIFT, H, hy3:movefocus, l, , warp"
            "ALT + SHIFT, J, hy3:movefocus, d, , warp"
            "ALT + SHIFT, K, hy3:movefocus, u, , warp"
            "ALT + SHIFT, L, hy3:movefocus, r, , warp"


            # Move workspace
            "$mod CTRL, L, workspace, e+1"
            "$mod CTRL, H, workspace, e-1"

            # Move window
            "SUPER, H, hy3:movewindow, l"
            "SUPER, J, hy3:movewindow, d"
            "SUPER, K, hy3:movewindow, u"
            "SUPER, L, hy3:movewindow, r"

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

            # Login etc
            "CTRL SHIFT, L, exec, uwsm stop"
            "CTRL SHIFT, S, exec, shutdown now"
            "CTRL SHIFT, R, exec, shutdown -r now"

            # Volume
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
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
            "SUPER, mouse:272, hy3:movewindow"
            "SUPER, mouse:273, resizewindow"
            ];
    };
}
