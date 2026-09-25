{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # シェル・エディター・開発環境
    nix-ld
    home-manager
    direnv
    git
    screen
    tmux
    emacs-nox
    vim

    # 汎用 CLI
    wget
    curl
    unzip
    gnumake
    tree
    tig
    xsel
    ripgrep
    fd
    jq

    # NFS・Kubernetes
    nfs-utils
    kubectl
    kubernetes-helm

    # 言語処理系
    rustup

    # クラウド・同期・AI
    awscli2
    eksctl
  ];
}
