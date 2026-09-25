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
  i18n.defaultLocale = "ja_JP.UTF-8";

  # 初回導入時の互換性基準。NixOS の更新に合わせて変更しない。
  system.stateVersion = "25.05";

  users.extraUsers.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "docker" "kubernetes" ];
    shell = pkgs.zsh;
  };
}
