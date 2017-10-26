# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./networking-configuration.nix
      ./services-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  virtualisation.virtualbox.guest.enable = true;

  # Select internationalisation properties.
  i18n = {
    consoleFont   = "lat9w-16";
    consoleKeyMap = "jp106";
    defaultLocale = "ja_JP.UTF-8";
  };

  time.timeZone = "Asia/Tokyo";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    screen
    zsh
    git
    emacs
    # (freetds.override { odbcSupport = true; unixODBC = unixODBC; })
  ];

  system.autoUpgrade.enable  = true;
  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-17.09";

  nix.maxJobs = 1;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.extraUsers.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  #   extraGroups = ["wheel" "docker"];
  #   shell = "/run/current-system/sw/bin/zsh";
  # };

}
