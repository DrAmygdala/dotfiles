{ pkgs }:
{
  enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      output = [
        "eDP-1"
        "HDMI-A-1"
      ];
      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "clock" ];
      modules-right = [ "cpu" "memory" "battery" ];
      clock = {
      	format = "{:%a, %d. %b  %H:%M}";
      };
      "sway/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
      };
      cpu = {
      	format = "CPU: {}%";
      };
      memory = {
      	format = "MEM: {}%";
      };
    };
  };
  style = ''
  * {
  	border: none;
  }

  window#waybar {
	background-color: transparent
  }

  .module {
	border-radius: 15px;
	margin: 0 1px;
  }
  '';
}
