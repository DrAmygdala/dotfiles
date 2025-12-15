{
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellGlobalAliases = {
       "-h" = "-h 2>&1 | bat --language=help --style=plain";
       "--help" = "--help 2>&1 | bat --language=help --style=plain";
    };
    enableCompletion = true;
    history = {
      expireDuplicatesFirst = true;
      save = 100000000;
      size = 1000000000;
    };
    oh-my-zsh = {
      enable = true;
      plugins = import ./oh-my-zsh-plugins.nix;
    };
  }
