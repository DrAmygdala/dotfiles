{ pkgs }:
{
  enable = true;
  package = pkgs.fuzzel;
  settings = {
    main = {
      layer = "overlay";
      terminal = "${pkgs.alacritty}/bin/alacritty";
    };
    colors = {
      background = "ffffffff";
    };
  };
}
