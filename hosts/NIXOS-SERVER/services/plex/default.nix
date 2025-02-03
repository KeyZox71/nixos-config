{ pkgs, ... }:

{
	services.plex = {
		enable = false;
		package = pkgs.unstable.plex;
		dataDir = "/BigBoyy/config/plex";
	};
}
