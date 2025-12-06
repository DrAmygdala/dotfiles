{ pkgs }:
{
    enable = true;
    protonPackages = [ pkgs.proton-ge-bin ];
    winePackages = [ pkgs.wineWow64Packages.full ];
    steamPackage = pkgs.steam;
}
