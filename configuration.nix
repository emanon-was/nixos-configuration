{ pkgs, ... }:

{
  imports = [
    ./wsl.nix
    ./nix.nix
    ./shell.nix
    ./packages.nix
    ./services.nix
    ./fonts.nix
  ];

  networking.hostName = "wsl";
  time.timeZone = "Asia/Tokyo";

  # 初回導入時の互換性基準。NixOS の更新に合わせて変更しない。
  system.stateVersion = "25.11";

  users.extraUsers.nixos = {
    extraGroups = [ "wheel" "audio" "docker" "kubernetes" ];
    shell = pkgs.zsh;
  };
}
