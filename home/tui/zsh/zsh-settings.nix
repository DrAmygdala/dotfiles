{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.my.zsh-plugins = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
  };

  config.my.pkgs = with pkgs; [
    zsh-completions
    nix-zsh-completions
  ];
  config.catppuccin.zsh-syntax-highlighting.enable = true;
  config.my.zsh-plugins = [
    "autojump"
    "direnv"
    "httpie"
    "docker"
    "docker-compose"
    "vi-mode"
  ];
  config.programs.zsh = {
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
      plugins = config.my.zsh-plugins;
    };
  };
}
