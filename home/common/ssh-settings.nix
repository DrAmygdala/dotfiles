{
  enable = true;
  enableDefaultConfig = false;
  matchBlocks = {
    "*" = {
      addKeysToAgent = "yes";
      compression = true;
      controlMaster = "no";
      controlPath = "~/.ssh/master-%r@%n:%p";
      controlPersist = "no";
      forwardAgent = false;
      hashKnownHosts = true;
      serverAliveCountMax = 3;
      serverAliveInterval = 0;
      userKnownHostsFile = "~/.ssh/known_hosts";
    };
  };
  includes = [
    "~/.ssh/config.d/config"
  ];
}
