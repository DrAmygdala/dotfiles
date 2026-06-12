{ pkgs, ... }:
{
  services.restic = {
    enable = true;
    backups = {
      homeBackup = {
        passwordFile = "/home/sourlemon/.restic-password";
        paths = [
          "/home/sourlemon/Documents"
          "/home/sourlemon/Downloads"
        ];
        pruneOpts = [
          "--keep-last=1"
        ];
        repository = "rest:https://restic.dnsaur.duckdns.org/kabir-laptop";
        timerConfig = {
          Persistent = true;
          OnCalendar = "*-*-* *:0/15:00";
        };
      };
    };
  };
  my.pkgs = [ pkgs.restic ];
}
