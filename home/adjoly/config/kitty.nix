{ config, ... }:

{
	programs.kitty = {
		enable = false;

		shellIntegration.enableZshIntegration = true;

		environment = {
	  	"KITTY_ENABLE_WAYLAND" = "1";
		};

		font = {
			name = "JetBrainsMono Nerd Font Mono";
			#package = pkgs.nerdfonts;
		};

		theme = "Catppuccin-Latte";
	};
}
