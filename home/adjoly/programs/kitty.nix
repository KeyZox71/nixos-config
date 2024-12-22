{
	programs.kitty = {
		enable = true;

		shellIntegration.enableZshIntegration = true;

		environment = {
		  	"KITTY_ENABLE_WAYLAND" = "1";
		};

		font = {
			name = "JetBrainsMono Nerd Font Mono";
			size = 13;
			#package = pkgs.nerdfonts;
		};

		extraConfig = "include ~/.config/kitty/current-theme.conf";
	};
}
