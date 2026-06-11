{ pkgs, lib, ... }:
{
  options.my.pkgs = lib.mkOption {
    type = lib.types.listOf lib.types.package;
    default = [ ];
  };

  config.my.pkgs = with pkgs; [
    jellyfin-desktop
    xwayland-satellite
    networkmanagerapplet
    isd
    lshw
    dmidecode
    btop
    fzf
    ripgrep
    fd
    tuc
    eza
    prettyping
    ncdu
    autojump
    atuin
    traceroute
    putty
    mtr
    restic
    tree
    lnav
    fuzzel
    yazi
    copyq
    betterdiscordctl
    kdePackages.kate
    httpie
    brightnessctl
    standardnotes
    libreoffice-fresh
    obsidian
    discord
    jq
    wireguard-tools
    evince
    gh
    unzip
    dnsutils
    freetube
    swayimg
    kubectl
    kubernetes-helm
    k9s
  ];
}
