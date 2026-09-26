{ pkgs, ... }:

{
  hardware.uinput.enable = true;

  services.libinput = {
    enable = true;
    touchpad.clickMethod = "clickfinger";
  };

  i18n = {
    defaultLocale = "ja_JP.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [ fcitx5-mozc ];
      };
    };
  };

  console = {
    font = "LatArCyrHeb-16";
    useXkbConfig = true;
  };

  services.xserver = {
    xkb.layout = "jp";
    xkb.model = "jp106";
    xkb.options = "ctrl:nocaps";
  };

  environment.sessionVariables = {
    XKB_DEFAULT_LAYOUT = "jp";
    XKB_DEFAULT_MODEL = "jp106";
    XKB_DEFAULT_VARIANT = "";
    XKB_DEFAULT_OPTIONS = "ctrl:nocaps";
  };
}
