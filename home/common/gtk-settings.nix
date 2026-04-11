{ pkgs, config, ... }:
{
  enable = true;
  gtk4.theme = config.gtk.theme;
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
