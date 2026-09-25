{ ... }:

{
  services.openssh.enable = true;
  virtualisation.docker.enable = true;

  # NFS
  boot.supportedFilesystems = [ "nfs" ];
  services.rpcbind.enable = true;
}
