{ pkgs }:
{
  enable = true;
  plugins = with pkgs; [
    thunar-volman
    thunar-archive-plugin
    thunar-media-tags-plugin
  ];
}
