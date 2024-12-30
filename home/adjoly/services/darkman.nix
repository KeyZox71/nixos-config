{ pkgs, ... }:
{
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
      lat = 45.6483;
      lng = 0.1609;
    };
  };
}
