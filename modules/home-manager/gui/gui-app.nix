{
	config,
	lib,
	pkgs,
	...
}:

{
	options = {
		gui-app.enable = lib.mkEnableOption "Can be used to install the default gui app";
	};

	config = lib.mkIf config.gui-app.enable {
		home.packages = with pkgs; [
			slack
			discord
			obsidian
			localsend
		];
	};
}
