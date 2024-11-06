{ pkgs, ... }:

{
	xdg.portal = {
		enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
	};
	programs.hyprland = {
		enable = true;
		#nvidiaPatches = true;
	};
	environment.sessionVariables = {
		WLR_NO_HARDWARE_CURSORS = "1";
		NIXOS_OZONE_WL = "1";
	};
	hardware = {
		graphics = {
			enable = true;
			enable32Bit = true;
			extraPackages = with pkgs; [
				intel-media-driver # LIBVA_DRIVER_NAME=iHD
				libvdpau-va-gl
			];
			extraPackages32 = with pkgs.pkgsi686Linux; [
				intel-vaapi-driver
			];
		};
		#nvidia.modesetting.enable = true;
	};
}
