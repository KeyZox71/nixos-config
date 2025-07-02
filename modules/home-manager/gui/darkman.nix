{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    keyzox.darkman.enable = lib.mkEnableOption "Can be used to enable darkman config (for autodarkmode)";
  };

  config = lib.mkIf config.keyzox.darkman.enable {

    xdg.configFile."xdg-desktop-portal/portals.conf" = {
      text = ''
        [preferred]
        org.freedesktop.impl.portal.Settings=darkman
      '';
    };

    services.darkman = {
      enable = true;
      lightModeScripts = {
        notification = ''
          dunstify --appname=darkman --urgency=low "switching to light mode" 
        '';
        system-light = ''
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
          dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita'"
        '';
      };
      darkModeScripts = {
        notification = ''
          dunstify --appname=darkman --urgency=low "switching to dark mode" 
        '';
        system-dark = ''
          dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
          dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita-dark'"
        '';
      };
      settings = {
        lat = 45.64;
        lng = 0.16;
        dbusserver = true;
        portal = true;
      };
    };
  };
}
