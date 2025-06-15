{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    keyzox.programs.hyprland.enable = lib.mkEnableOption "to enable hyprland";
  };

  config = lib.mkIf config.keyzox.programs.hyprland.enable {
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
      ];
    };
    programs.hyprland = {
      enable = true;
    };
    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
      QT_STYLE_OVERRIDE = "Fusion";
      QT_QPA_PLATFORM = "wayland";
      GDK_BACKEND = "wayland";
      CLUTTER_BACKEND = "wayland";
      KITTY_ENABLE_WAYLAND = "1";
      MOZ_ENABLE_WAYLAND = 1;
    };

    services.displayManager = {
      defaultSession = "hyprland";
    };

    environment.systemPackages = with pkgs; [
      wl-clipboard
    ];
  };
}
