{ config, ... }:

{
  imports = [ <nixos-wsl/modules> ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";
  wsl.wslConf.network.hostname = config.networking.hostName;
}
