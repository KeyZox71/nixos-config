{ inputs, outputs, lib, config, pkgs, theme, ... }:

{
	imports = [

		./dev.nix
		./wm/hyprland.nix

		./config/kitty.nix
		./config/zsh.nix
		./config/tmux.nix

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
		home-manager.enable = true;
	};

	services.nextcloud-client = {
		enable = true;
		startInBackground = true;
	};

	nixpkgs = {
		config = {
			allowUnfree = true;
			allowUnfreePredicate = (_: true);
		};
	};

	home = {
		packages = with pkgs; [
			obsidian
			onlyoffice-bin
			vlc
			prismlauncher
			tradingview
			molotov
			vivaldi
			vivaldi-ffmpeg-codecs
			discord
			ripgrep
			tmux
			plex-media-player
			beeper
			nerdfonts
			nextcloud-client
			neovim
		];
		stateVersion = "24.05";
	};
}
