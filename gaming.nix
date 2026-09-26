{ ... }:

{
  hardware.xpadneo.enable = true;
  hardware.xone.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  services.joycond.enable = true;
}
