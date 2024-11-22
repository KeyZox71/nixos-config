{ inputs, pkgs, ... }:
{
	imports = [
		./gtk.nix
		./cli-app.nix
		./wm/hyprland.nix
		./theme/catppuccin.nix

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

		inputs.catppuccin.homeManagerModules.catppuccin
	];

	programs = {
		git = {
			enable = true;
			userName = "adjoly";
			userEmail = "adamjly@proton.me";
		};
		gh = {
			enable = true;
			settings = {
				git_protocol = "ssh";
			};
		};
	};

	home = {
		packages = with pkgs; [
			vlc
			beeper
			zenity
			molotov
			discord
			obsidian 
			hyprpaper
			parsec-bin
			libreoffice
			tradingview
			qbittorrent
			prismlauncher
			nextcloud-client
			unstable.vivaldi
			vivaldi-ffmpeg-codecs
		];
		stateVersion = "24.05";
	};
}
