# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./services-configuration.nix
      ./fonts-configuration.nix
    ];

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "23.11"; # Did you read the comment?

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/nvme0n1"; # or "nodev" for efi only
  boot.loader.grub.forceInstall = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.systemd-boot.enable = true;

  networking.hostName = "X1Carbon"; # Define your hostname.
  networking.firewall.autoLoadConntrackHelpers = true;
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [ ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git screen tmux zsh vim emacs
  ];


  nix.settings.max-jobs = lib.mkDefault 4;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.extraUsers.emanon = {
  #   isNormalUser = true;
  #   uid = 1000;
  #   extraGroups = ["wheel" "audio" "docker" "kubernetes"];
  #   shell = pkgs.zsh;
  # };

}
