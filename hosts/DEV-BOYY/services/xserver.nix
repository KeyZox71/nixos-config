{ ... }:

{
	services.displayManager = {
		defaultSession = "hyprland";
	};
	services.xserver = {
		enable = true;
		videoDrivers = [ "nvidia" ];
		xkb = {
			layout = "us";
			variant = "intl";
		};
	};
	services.libinput = {
		enable = true;
		mouse.accelProfile = "flat";
	};
}
