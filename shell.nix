{ pkgs, ... }:

{

  programs = {
    vim = {
      enable = true;
      defaultEditor = true;
    };
    nix-ld = {
      enable = true;
    };
    bash = {
      completion.enable = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
    };
    direnv = {
      package = pkgs.direnv;
      silent = false;
      loadInNixShell = true;
      direnvrcExtra = "";
      nix-direnv = {
        enable = true;
        package = pkgs.nix-direnv;
      };
    };
  };

  environment.sessionVariables.VISUAL = "vim";
}
