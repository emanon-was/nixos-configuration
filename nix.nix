{ lib, options, ... }:

{
  nix.nixPath = options.nix.nixPath.default ++ [
    "nixpkgs-unstable=https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz"
  ];

  nix.settings = {
    max-jobs = lib.mkDefault 4;
    experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };
}
