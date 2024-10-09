{ pkgs, ... }:
{
	services.darkman = {
		enable = true;
		lightModeScripts = {
			kitty-light = ''rm /home/adjoly/.config/kitty/current-theme.conf
				cp ${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Latte.conf /home/adjoly/.config/kitty/current-theme.conf
				kill -SIGUSR1 $(pidof kitty)'';
			notification = ''dunstify --appname=darkman --urgency=low "switching to light mode" 
				'';
		};
		darkModeScripts = {
			kitty-dark = ''rm /home/adjoly/.config/kitty/current-theme.conf
				cp ${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Frappe.conf /home/adjoly/.config/kitty/current-theme.conf
				kill -SIGUSR1 $(pidof kitty)'';
			notification = ''dunstify --appname=darkman --urgency=low "switching to dark mode" 
				'';
		};
		settings = {
			lat = 45.6483;
			lng = 0.1609;
		};
	};
}
