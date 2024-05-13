{ pkgs, lib, config, inputs, outputs, ... }:

{
	services.xserver = {
		enable = true;
		displayManager.gdm.enable = true;
		desktopManager.gnome.enable = true;
    layout = "us";
    xkbVariant = "intl";
		libinput = {
			enable = true;
			mouse.accelProfile = "flat";
		};
  };
}
