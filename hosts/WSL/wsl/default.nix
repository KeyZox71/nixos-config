{ ... }:

{
	wsl = {
		enable = true;
		defaultUser = "adjoly";
		docker-desktop.enable = true;
		#		nativeSystemd = true;
		startMenuLaunchers = true;
		wslConf.network.hostname = "wsl-adjoly";
	};
}
