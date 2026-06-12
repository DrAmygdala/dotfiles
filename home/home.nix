{
  pkgs,
  config,
  ...
}:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "sourlemon";
  home.homeDirectory = "/home/sourlemon";

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

  imports = [
    ./tui/k8s.nix
    ./tui/direnv-settings.nix
    ./tui/prompt/starship-settings.nix
    ./tui/git/git.nix
    ./nixvim.nix
    ./tui/alacritty.nix
    ./tui/nh.nix
    ./gui/foliate.nix
    ./email/proton.nix
    ./noctalia.nix
    ./gui/anki.nix
    ./tui/zsh/zsh-settings.nix
    ./packages.nix
  ];

  nixpkgs.config = import ./common/config.nix;

  home.shellAliases = import ./common/shell-aliases.nix;

  home.sessionVariables = {
    EDITOR = "nvim";
    MANPAGER = "bat -plman";
  };

  home.packages = config.my.pkgs;

  catppuccin = {
    flavor = "mocha";
    accent = "maroon";
    autoEnable = false;
    alacritty.enable = true;
    eza.enable = true;
    fuzzel.enable = true;
    delta.enable = true;
    k9s.enable = true;
    yazi.enable = true;
    btop.enable = true;
    freetube.enable = true;
    swaylock.enable = true;
    bat.enable = true;
    # cursors.enable = true;
    thunderbird = {
      enable = true;
      profile = "primary";
    };
  };
  gtk = (import ./common/gtk-settings.nix { inherit pkgs config; });
  xdg = import ./common/xdg-settings.nix;

  editorconfig = import ./common/editorconfig.nix;
  services.swaync = import ./common/swaync-settings.nix;
  services.restic = import ./common/restic.nix;
  services.psd.enable = true;
  services.copyq.enable = true;
  services.wlsunset = import ./common/wlsunset-settings.nix;
  services.swayidle = import ./common/swayidle-settings.nix { inherit pkgs; };
  services.flameshot = import ./common/flameshot-settings.nix;

  programs.bat.enable = true;
  programs.tmux = (import ./common/tmux-settings.nix { inherit pkgs; });
  programs.vscodium = (import ./common/vscode-settings.nix { inherit pkgs; });
  programs.fuzzel = (import ./common/fuzzel-settings.nix { inherit pkgs; });
  programs.tealdeer = import ./common/tealdeer-settings.nix;
  programs.ssh = import ./common/ssh-settings.nix;
  programs.swaylock = import ./common/swaylock-settings.nix;
  # programs.lutris = import ./common/lutris-settings.nix { inherit pkgs; };
}
