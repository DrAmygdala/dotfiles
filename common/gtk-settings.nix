{ pkgs }:
{
    enable = true;
    theme = {
      name = "Flat-Remix-GTK-Violet-Dark";
      package = pkgs.flat-remix-gtk;
    };

    iconTheme = {
      name = "Flat-Remix-Blue-Dark";
      package = pkgs.flat-remix-icon-theme;
    };

    font = {
      package = pkgs.nerd-fonts.hack;
      name = "Hack Nerd Font";
      size = 12;
    };
  }
