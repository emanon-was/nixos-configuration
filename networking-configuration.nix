# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ];

  networking.hostName = "nixos"; # Define your hostname.
  networking.hostId = "f912fbd1";

  networking.interfaces.enp0s8.ip4 = [ { address = "192.168.56.100"; prefixLength = 24; } ];

  networking.firewall.enable = false;
  # networking.firewall.allowedTCPPorts = [22 80 8118];
}

