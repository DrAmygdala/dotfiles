{
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    history = {
      expireDuplicatesFirst = true;
      save = 100000000;
      size = 1000000000;
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "autojump"
        "sudo"
        "git-flow"
        "direnv"
        "kubectl"
      ];
    };
  }
