{ pkgs }:
{
  enable = true;
  events = {
    "before-sleep" = "${pkgs.swaylock}/bin/swaylock -fF";
  };
  timeouts = [
    {
      timeout = 300;
      command = "${pkgs.swaylock}/bin/swaylock -fF";
    }
    {
      timeout = 600;
      command = "[ cat /sys/class/power_supply/ACAD/online -eq 0 ] && ${pkgs.systemd}/bin/systemctl suspend";
    }
  ];
}
