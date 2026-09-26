{ lib, ... }:

{
  nixpkgs.config = {
    allowUnfree = true;
  };

  nixpkgs.overlays = [
    (_final: prev: {
      unstable = import <unstable> {
        system = prev.stdenv.hostPlatform.system;
        config.allowUnfree = true;
      };
    })
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    max-jobs = lib.mkDefault 4;
  };

}
