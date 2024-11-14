{ pkgs, ... }:
{
  services.darkman = {
    enable = true;
    lightModeScripts = {
      kitty-light = ''
rm -f /home/adjoly/.config/kitty/current-theme.conf
cp ${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Latte.conf /home/adjoly/.config/kitty/current-theme.conf
kill -SIGUSR1 $(pidof kitty)'';
      notification = ''
dunstify --appname=darkman --urgency=low "switching to light mode" 
        				'';
      system-light = ''
dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Adwaita'"
      '';
    };
    darkModeScripts = {
      kitty-dark = ''
rm -f /home/adjoly/.config/kitty/current-theme.conf
cp ${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Frappe.conf /home/adjoly/.config/kitty/current-theme.conf
kill -SIGUSR1 $(pidof kitty)'';
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
