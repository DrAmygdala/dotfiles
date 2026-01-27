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
      command = "${pkgs.systemd}/bin/systemctl suspend";
    }
  ];
}
