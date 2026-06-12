{ pkgs, ... }:
{
  # Useful references:
  # - https://linux-gaming.kwindu.eu/index.php/Main_Page
  programs.lutris = {
    enable = true;
    protonPackages = [ pkgs.proton-ge-bin ];
    winePackages = [ pkgs.wineWow64Packages.full ];
    steamPackage = pkgs.steam;
  };
}
