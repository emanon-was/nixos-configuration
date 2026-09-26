{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./nix.nix
    ./shell.nix
    ./packages.nix
    ./services.nix
    ./desktop.nix
    ./input.nix
    ./gaming.nix
    ./fonts.nix
  ];

  # 現在の互換性基準を保持する。
  system.stateVersion = "26.05";

  networking = {
    hostName = "X1Carbon";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      # Brave と Steam のローカル機器検出（mDNS）を維持する。
      allowedUDPPorts = [ 5353 ];
    };
  };

  time.timeZone = "Asia/Tokyo";

  users.extraUsers.emanon = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "audio" "docker" "input" "uinput" ];
    shell = pkgs.zsh;
  };
}
