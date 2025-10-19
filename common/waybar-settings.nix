{ pkgs }:
{
  enable = true;
  systemd.enable = true;
  settings = {
    mainBar = {
      layer = "top";
      position = "top";
      height = 30;
      output = [
        "eDP-1"
        "HDMI-A-1"
      ];
      modules-left = [ "sway/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [ "tray" "wireplumber" "cpu" "memory" "battery" ];
      clock = {
      	format = "{:%a, %d. %b  %H:%M}";
      };
      "hyprland/workspaces" = {
        move-to-monitor = true;
      };
      wireplumber = {
        format = "{volume}% {icon}";
        format-icons = {
          default = [ "" "" ];
        };
        format-muted = "";
      };
      cpu = {
        interval = 1;
        format = "{icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}";
        format-icons = [
          "<span color='#69ff94'>▁</span>" # green
          "<span color='#2aa9ff'>▂</span>" # blue
          "<span color='#f8f8f2'>▃</span>" # white
          "<span color='#f8f8f2'>▄</span>" # white
          "<span color='#ffffa5'>▅</span>" # yellow
          "<span color='#ffffa5'>▆</span>" # yellow
          "<span color='#ff9977'>▇</span>" # orange
          "<span color='#dd532e'>█</span>" # red
        ];
      };
      memory = {
        interval = 1;
      	format = "{}% ";
      };
      battery = {
        bat = "BAT1";
        interval = 60;
        states = {
            warning = 30;
            critical = 15;
        };
        format = "{capacity}% {icon}";
        format-icons = ["" "" "" "" ""];
        max-length = 25;
      };
    };
  };
}
