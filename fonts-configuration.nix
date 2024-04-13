{ config, lib, pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [ 
      noto-fonts
      noto-fonts-extra
      noto-fonts-cjk
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      source-code-pro
      source-sans-pro
      source-serif-pro
      source-han-code-jp
      source-han-sans-japanese
      source-han-serif-japanese
    ];

    fontconfig = { 
      defaultFonts = {
        monospace = [
          "Noto Sans Mono"
          "Noto Sans Mono CJK JP"
          "Source Code Pro"
        ];
        serif = [
          "Noto Serif"
          "Source Serif Pro"
          "Source Han Serif JP"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Sans CJK JP"
          "Source Sans Pro"
          "Source Han Sans JP"
        ];
      };
    };
  };
}
