{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [ 
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      nerd-fonts.noto
      hackgen-font
      hackgen-nf-font
    ];

    fontconfig = { 
      defaultFonts = {
        monospace = [
          "HackGen Console"
          "HackGen Console NF"
          "Noto Sans Mono CJK JP"
          "Noto Sans Mono"
          "NotoMono NF"
        ];
        serif = [
          "Noto Serif CJK JP"
          "Noto Serif"
        ];
        sansSerif = [
          "Noto Sans CJK JP"
          "Noto Sans"
        ];
        emoji = [
          "Noto Color Emoji"
        ];
      };
    };
  };
}
