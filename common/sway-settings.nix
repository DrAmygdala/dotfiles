{ pkgs }:
{
  enable = true;
  config = rec {
    modifier = "Mod4";
    terminal = "alacritty"; 
    menu = "${pkgs.fuzzel}/bin/fuzzel";
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
