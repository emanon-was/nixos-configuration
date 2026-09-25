{ pkgs, ... }:

{
  programs = {
    vim = {
      enable = true;
      defaultEditor = true;
    };
    nix-ld = {
      enable = true;
      libraries = with pkgs; [ stdenv.cc.cc zlib openssl curl glib ];
    };
    bash.completion.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
    };
    direnv = {
      enable = true;
      silent = false;
      loadInNixShell = true;
      nix-direnv.enable = true;
    };
  };

  environment.sessionVariables.VISUAL = "vim";
}
