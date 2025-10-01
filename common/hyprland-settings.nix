{ pkgs, inputs }:
{
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    plugins = [
        inputs.hy3.packages.x86_64-linux.hy3
    ];
    settings = {
        # n - navigation
        # m - move
        # w - workspace
        # wd - window
        # t - tab
        "$nw" = "CTRL SUPER";
        "$nwd" = "CTRL";
        "$nt" = "CTRL SHIFT";
        "$mw" = "ALT CTRL";
        "$mwd" = "ALT SUPER";
        "$mt" = "ALT SHIFT";
        "$cmd" = "ALT";
        exec-once = [
            "waybar"
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
            ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"

        ];
        bind =
          [
            "$cmd, S, exec, alacritty"
            "$cmd, SPACE, exec, ${pkgs.fuzzel}/bin/fuzzel"
            "$cmd, W, exec, ${pkgs.wlogout}/bin/wlogout"
            "$cmd, Q, killactive"

            # Tabs
            "$cmd, z, hy3:makegroup, tab, toggle"

            # Move focus
            "$nwd, H, hy3:movefocus, l, visible, warp"
            "$nwd, J, hy3:movefocus, d, visible, warp"
            "$nwd, K, hy3:movefocus, u, visible, warp"
            "$nwd, L, hy3:movefocus, r, visible, warp"
            "$nt, H, hy3:movefocus, l, , warp"
            "$nt, J, hy3:movefocus, d, , warp"
            "$nt, K, hy3:movefocus, u, , warp"
            "$nt, L, hy3:movefocus, r, , warp"

            # Navigate workspace
            "$nw, L, workspace, e+1"
            "$nw, H, workspace, e-1"
            "$mw, L, movetoworkspace, e+1"
            "$mw, H, movetoworkspace, e-1"

            # Move window
            "$mwd, H, hy3:movewindow, l"
            "$mwd, J, hy3:movewindow, d"
            "$mwd, K, hy3:movewindow, u"
            "$mwd, L, hy3:movewindow, r"

            # Switch window
            "SUPER, Tab, cyclenext"
            "SHIFT SUPER, Tab, cyclenext, prev"
            "ALT, Tab, workspace, previous" # Cycle recent workspaces

            # Resize window
            #"CTRL ALT, H, resizeactive, -240 0"
            #"CTRL ALT, L, resizeactive, 180 0"
            #"CTRL ALT, K, resizeactive, 0 -240"
            #"CTRL ALT, J, resizeactive, 0 180"

            # Login etc
            "$cmd, I, exec, uwsm stop"
            "$cmd, O, exec, shutdown now"
            "$cmd, P, exec, shutdown -r now"

            # Volume
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (builtins.genList (i:
                let ws = i + 1;
                in [
                  "$nw, code:1${toString i}, workspace, ${toString ws}"
                  "$mw, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
              )
              9)
          );
          bindm =
            [
            # Move/Resize windows with SUPER LMB/RMB and dragging
            "$cmd, mouse:272, hy3:movewindow"
            "$cmd, mouse:273, resizewindow"
            ];
    };
}
