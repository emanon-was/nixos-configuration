{ ... }:

{
  services.openssh.enable = true;

  virtualisation.docker = {
    enable = true;
    extraOptions = "--iptables=false --ip-masq=false";
  };

  # NFS
  boot.supportedFilesystems = [ "nfs" ];
  services.rpcbind.enable = true;
}
