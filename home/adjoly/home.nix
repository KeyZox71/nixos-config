{ inputs, outputs, lib, config, pkgs, theme, ... }:

{
	imports = [

		./dev.nix
		./wm/hyprland.nix

		./config/kitty.nix
		./config/pogit.nix
		./config/flameshot.nix
		./config/zsh.nix
		./config/tmux.nix
		./config/nvim.nix

		inputs.catppuccin.homeManagerModules.catppuccin
];

	catppuccin = {
		enable = true;
		flavor = "frappe";
		accent = "lavender";
		pointerCursor = {
			enable = true;
			accent = "lavender";
			flavor = "frappe";
		};
	};
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
			vlc
			tmux
			neovim
			beeper
			ripgrep
			molotov
			vivaldi
			discord
			obsidian
			playerctl
			parsec-bin
			tradingview
			prismlauncher
			onlyoffice-bin
			nextcloud-client
			plex-media-player
			lua-language-server
			vivaldi-ffmpeg-codecs
		];
		stateVersion = "24.05";
	};
}
