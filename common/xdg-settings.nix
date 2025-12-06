{ pkgs }:
{
    portal = {
        enable = true;
        config = {
            common = {
                default = [
                    "kde"
                ];
            };
        };
        extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
    };
    userDirs = {
        enable = true;
        desktop = null;
        music = null;
        pictures = null;
        publicShare = null;
        templates = null;
        videos = null;
    };
}
