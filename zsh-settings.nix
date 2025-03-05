{
    enable = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    initExtra = ''
      export NVM_DIR="$([ -z "$HOME/.config-" ] && printf %s "$HOME/.nvm" || printf %s "$HOME/.config/nvm")" 
      [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
      export PATH="/home/kabir/.local/bin:$PATH"
    '';
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
        "fd"
        "git-flow"
        "pyenv"
        "nvm"
        "yarn"
        "poetry"
      ];
    };
  }
