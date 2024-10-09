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
		opengl = {
			enable = true;
			driSupport = true;
			driSupport32Bit = true;
			extraPackages = with pkgs; [
				intel-media-driver # LIBVA_DRIVER_NAME=iHD
				intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
				#vaapiVdpau
				libvdpau-va-gl
				#vpl-gpu-rt
			];
		};
		#nvidia.modesetting.enable = true;
	};
}
