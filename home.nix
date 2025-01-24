{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "kabir";
  home.homeDirectory = "/home/kabir";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config = import ./config.nix;

  home.shellAliases = import ./shell-aliases.nix;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = lib.mkMerge [ 
    (import ./general-packages.nix { inherit pkgs; })
    (import ./k8s-packages.nix { inherit pkgs; })
    (import ./git-packages.nix { inherit pkgs; })
    (import ./zsh-packages.nix { inherit pkgs; })
  ];

  programs.starship = import ./starship-settings.nix;

  programs.tmux = (import ./tmux-settings.nix { inherit pkgs; });

  programs.git = import ./git-settings.nix;

  programs.zsh = {
    enable = true;
    autocd = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
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
  };
}
