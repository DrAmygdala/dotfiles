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

  nixpkgs.config = import ./common/config.nix;

  home.shellAliases = import ./common/shell-aliases.nix;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = lib.mkMerge [
    (import ./common/general-packages.nix { inherit pkgs inputs; })
    (import ./common/git-packages.nix { inherit pkgs; })
    (import ./work/git-packages.nix { inherit pkgs; })
    (import ./common/zsh-packages.nix { inherit pkgs; })
  ];

  wayland.windowManager.hyprland = (import ./common/hyprland-settings.nix { inherit pkgs; });
  editorconfig = import ./common/editorconfig.nix;
  services.hyprpaper = import ./common/hyprpaper-settings.nix;

  programs.waybar = (import ./common/waybar-settings.nix { inherit pkgs; });
  programs.starship = import ./common/starship-settings.nix;
  programs.tmux = (import ./common/tmux-settings.nix { inherit pkgs; });
  programs.git = let
    mergedGit = import (./common/git-settings.nix) // import (./work/git-settings.nix);
    in
    mergedGit;
  programs.zsh = let
    mergedZsh = import (./common/zsh-settings.nix) // { oh-my-zsh.plugins = import (./common/oh-my-zsh-plugins.nix) ++ import (./work/oh-my-zsh-plugins.nix); };
    in
    mergedZsh;
  programs.alacritty = import ./common/alacritty-settings.nix;
  programs.vscode = (import ./common/vscode-settings.nix { inherit pkgs; });
  programs.fuzzel = (import ./common/fuzzel-settings.nix { inherit pkgs; });
  programs.wlogout = import ./common/wlogout-settings.nix;
  programs.direnv = import ./common/direnv-settings.nix;
  programs.neovim = (import ./common/nvim-settings.nix {inherit pkgs; });
  programs.tealdeer = import ./common/tealdeer-settings.nix;
}
