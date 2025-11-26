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
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config = import ./common/config.nix;

  home.shellAliases = import ./common/shell-aliases.nix;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.packages = lib.mkMerge [
    (import ./common/general-packages.nix { inherit pkgs; })
    (import ./common/k8s-packages.nix { inherit pkgs; })
    (import ./common/git-packages.nix { inherit pkgs; })
    (import ./common/zsh-packages.nix { inherit pkgs; })
  ];

  catppuccin = {
    flavor = "mocha";
    accent = "maroon";
    alacritty.enable = true;
    waybar.enable = true;
    swaync.enable = true;
    eza.enable = true;
    fuzzel.enable = true;
    delta.enable = true;
    k9s.enable = true;
    zsh-syntax-highlighting.enable = true;
    yazi.enable = true;
    btop.enable = true;
    freetube.enable = true;
    swaylock.enable = true;
    # sway.enable = true;
    # cursors.enable = true;
    thunderbird = {
        enable = true;
        profile = "primary";
    };
  };
  gtk = (import ./common/gtk-settings.nix { inherit pkgs; });
  xdg = import ./common/xdg-settings.nix;

  wayland.windowManager.sway = (import ./common/sway-settings.nix { inherit pkgs lib; });
  editorconfig = import ./common/editorconfig.nix;
  services.swaync = import ./common/swaync-settings.nix;
  services.network-manager-applet.enable = true;
  services.blueman-applet.enable = true;
  services.restic = import ./common/restic.nix;
  services.psd.enable = true;
  services.copyq.enable = true;
  services.wlsunset = import ./common/wlsunset-settings.nix;
  services.swayidle = import ./common/swayidle-settings.nix { inherit pkgs; };
  services.flameshot = import ./common/flameshot-settings.nix;

  programs.delta = import ./common/delta-settings.nix;
  programs.thunderbird = import ./common/thunderbird-settings.nix;
  programs.waybar = (import ./common/waybar-settings.nix { inherit pkgs; });
  programs.starship = import ./common/starship-settings.nix;
  programs.tmux = (import ./common/tmux-settings.nix { inherit pkgs; });
  programs.git = import ./common/git-settings.nix;
  programs.zsh = import ./common/zsh-settings.nix;
  programs.alacritty = import ./common/alacritty-settings.nix;
  programs.vscode = (import ./common/vscode-settings.nix { inherit pkgs; });
  programs.fuzzel = (import ./common/fuzzel-settings.nix { inherit pkgs; });
  programs.wlogout = import ./common/wlogout-settings.nix;
  programs.direnv = import ./common/direnv-settings.nix;
  programs.nixvim = import ./common/nixvim.nix { inherit pkgs; };
  programs.tealdeer = import ./common/tealdeer-settings.nix;
  programs.ssh = import ./common/ssh-settings.nix;
  programs.swaylock = import ./common/swaylock-settings.nix;
}
