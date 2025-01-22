{ pkgs, ... }:

{
	services.plex = {
		enable = true;
		package = pkgs.unstable.plex;
		dataDir = "/BigBoyy/config/plex";
	};
}
