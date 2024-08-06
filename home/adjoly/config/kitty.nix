{ config, ... }:

{
	programs.kitty = {
		enable = true;

		shellIntegration.enableZshIntegration = true;

		environment = {
	  	"KITTY_ENABLE_WAYLAND" = "1";
		};

		font = {
			name = "JetBrainsMono Nerd Font Mono";
			#package = pkgs.nerdfonts;
		};

		catppuccin.enable = true;
	};
}
