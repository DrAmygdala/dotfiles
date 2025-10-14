{ pkgs }:
{
  enable = true;
  systemd.enable = true;
  config = rec {
    modifier = "Mod4";
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
