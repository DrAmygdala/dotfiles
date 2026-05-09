{ pkgs, ... }:
{
  programs.anki = {
    enable = true;
    addons = with pkgs.ankiAddons; [
      review-heatmap
      fsrs4anki-helper
    ];
    profiles.me = {
      default = true;
      sync = {
        autoSync = true;
        autoSyncMediaMinutes = 15;
        keyFile = "/home/sourlemon/Downloads/anki-sync-key.txt";
        syncMedia = true;
        url = "https://anki.dnsaur.duckdns.org";
      };
    };
  };
  catppuccin.anki.enable = true;
}
