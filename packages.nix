{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # シェル・エディター・開発環境
    home-manager
    git
    screen
    tmux
    emacs
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
    nodejs_22

    # クラウド
    awscli2
    eksctl
    s3fs
  ];
}
