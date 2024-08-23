{ pkgs, lib, config, inputs, outputs, ... }:

{
	services.displayManager = {
		defaultSession = "hyprland";
	};
	services.xserver = {
		enable = true;
		#displayManager.gdm.enable = true;
		#desktopManager.gnome.enable = true;
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
