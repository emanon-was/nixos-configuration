{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    screen
    tmux
    ghostty
    vim
    wget
    curl
    unzip
    direnv
    gnumake
    tree
    tig
    xsel
    ripgrep
    fd
    jq

    brave
    slack
    discord
    spotify
    obsidian
    haruna # Open source video player built with Qt/QML and libmpv
    unstable.zed-editor-fhs
    rustup
    awscli
    s3fs

    usbutils
    libwebp
    poppler-utils
    yt-dlp
  ];
}
