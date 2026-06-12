{ pkgs, ... }:
{
  my.pkgs = with pkgs; [
    kubectl
    kubernetes-helm
    k9s
  ];
  my.zsh-plugins = [
    "kubectl"
    "helm"
    "k9s"
  ];
}
