{ ... }:

{
  hardware.graphics.enable = true;
  services.xserver.enable = true;

  services.desktopManager.plasma6.enable = true;
  services.displayManager = {
    defaultSession = "plasma"; # Plasma Wayland
    plasma-login-manager = {
      enable = true;
      settings.Greeter.PreselectedSession = "plasma.desktop";
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
