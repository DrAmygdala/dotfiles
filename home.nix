{ config, pkgs, lib, inputs, ... }:

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
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config = import ./config.nix;

  home.shellAliases = import ./shell-aliases.nix;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = lib.mkMerge [ 
    (import ./general-packages.nix { inherit pkgs inputs; })
    (import ./k8s-packages.nix { inherit pkgs; })
    (import ./git-packages.nix { inherit pkgs; })
    (import ./zsh-packages.nix { inherit pkgs; })
  ];

  wayland.windowManager.sway = (import ./sway-settings.nix { inherit pkgs; });

  programs.waybar = (import ./waybar-settings.nix { inherit pkgs; });
  programs.starship = import ./starship-settings.nix;
  programs.tmux = (import ./tmux-settings.nix { inherit pkgs; });
  programs.git = import ./git-settings.nix;
  programs.zsh = import ./zsh-settings.nix;
  programs.alacritty = import ./alacritty-settings.nix;
  programs.vscode = (import ./vscode-settings.nix { inherit pkgs; });
  programs.fuzzel = (import ./fuzzel-settings.nix { inherit pkgs; });
  programs.wlogout = import ./wlogout-settings.nix;
}
