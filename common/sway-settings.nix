{ pkgs, lib }:
{
  enable = true;
  systemd.enable = true;
  config = rec {
    modifier = "Mod4";
    keybindings = lib.mkOptionDefault {
       "CTRL+l" = "focus right";
       "CTRL+k" = "focus up";
       "CTRL+j" = "focus down";
       "CTRL+h" = "focus left";
       "CTRL+Mod4+l" = "workspace next";
       "CTRL+Mod4+h" = "workspace prev";
       "ALT+Space" = "exec ${pkgs.fuzzel}/bin/fuzzel";
       "ALT+f" = "exec ${pkgs.firefox}/bin/firefox";
       "ALT+s" = "exec ${pkgs.alacritty}/bin/alacritty";
       "ALT+q" = "kill";
       "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
       "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
       "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
       "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
       "XF86AudioLowerVolume" = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-";
    };
    terminal = "alacritty";
    menu = "${pkgs.fuzzel}/bin/fuzzel";
    output = {
        "eDP-1" = {
            scale = "1.6";
        };
    };
    bars = [ ];
    startup = [
      {command = "alacritty";}
    ];
    focus = {
	    followMouse = false;
    };
    window = {
    	titlebar = false;
    };
    workspaceAutoBackAndForth = true;
  };
}
