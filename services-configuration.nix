# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ];

  services.openssh.enable = true;

  services.privoxy.enable = true;
  services.privoxy.listenAddress = "0.0.0.0:8118";
  services.privoxy.actionsFiles = [ ];
  services.privoxy.filterFiles  = [ ];

  virtualisation.docker.enable = true;

  # services.nginx.enable = true;
  # services.nginx.config = pkgs.lib.readFile /etc/nginx/nginx.conf;

  # services.haproxy.enable = true;
  # services.haproxy.config = pkgs.lib.readFile /etc/haproxy/haproxy.cfg;

}
