{
    enable = true;
    backups = {
        homeBackup = {
            passwordFile = "/home/kabir/.restic-password";
            paths = [
                "/home/kabir/Documents"
                "/home/kabir/Downloads"
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
}

