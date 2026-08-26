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
    tree
    lnav
    fuzzel
    yazi
    copyq
    betterdiscordctl
    discord
    kdePackages.kate
    httpie
    brightnessctl
    standardnotes
    libreoffice-fresh
    obsidian
    jq
    wireguard-tools
    evince
    gh
    unzip
    dnsutils
    freetube
    swayimg
  ];
}
