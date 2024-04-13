{ config, pkgs, ... }:

{
  # Enable CUPS to print documents.
  # services.printing.enable = true;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  i18n = {
    defaultLocale = "ja_JP.UTF-8";
    inputMethod = {
      enabled = "ibus";
      ibus.engines = with pkgs.ibus-engines; [ anthy mozc ];
    };
  };

  programs.bash.enableCompletion = true;
  programs.zsh.enable = true;
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };


  # Enable the OpenSSH daemon.
  services.openssh.enable = true;


  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "jp";
  services.xserver.xkbModel = "jp106";
  services.xserver.xkbOptions = "ctrl:nocaps";

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # services.xserver.displayManager.gdm.wayland = false;
  # services.xserver.autorun = true;

  # Enable touchpad support.
  services.xserver.libinput.enable = true;
  services.xserver.libinput.touchpad.clickMethod = "clickfinger";
  # services.xserver.cmt.enable = true;

  virtualisation.docker = {
    enable = true;
    extraOptions = "--iptables=false --ip-masq=false";
  };

  environment.systemPackages = with pkgs; [
    git
    screen
    tmux
    emacs
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
    rustup
    awscli
    s3fs
    # for GUI
    gnome.gedit
    gnome.gnome-tweaks
    firefox
    google-chrome
    slack
    discord
    spotify
  ];

  nixpkgs.config.permittedInsecurePackages = with pkgs; [
  ];
}
