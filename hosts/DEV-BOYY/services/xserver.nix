{ ... }:

{
	services.displayManager = {
		defaultSession = "hyprland-uwsm";
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
