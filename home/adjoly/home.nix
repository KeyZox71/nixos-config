{ inputs, pkgs, ... }:
{
	imports = [
		./gtk.nix
		./cli-app.nix
		./wm/hyprland.nix
		./wm/monitor-laptop.nix
		./themes/catppuccin.nix

		./unstable-overlay.nix

		./services/nextcloud.nix
		./services/darkman.nix

		./programs/git.nix
		./programs/tmux.nix
		./programs/pogit.nix
		./programs/kitty.nix
		./programs/neovim.nix
		./programs/direnv.nix
		./programs/fastfetch.nix
		./programs/shell/zsh.nix

		inputs.catppuccin.homeModules.catppuccin
	];

	home = {
		packages = with pkgs; [
			vlc
			#beeper
			zenity
			molotov
			discord
			obsidian 
			hyprpaper
			parsec-bin
			libreoffice
			tradingview
			qbittorrent
			rquickshare
			prismlauncher
			nextcloud-client
			#unstable.ankama-launcher
		];
		stateVersion = "24.05";
	};
}
