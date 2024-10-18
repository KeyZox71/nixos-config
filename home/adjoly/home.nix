{ inputs, outputs, lib, config, pkgs, theme, ... }:

{
	imports = [
		./gtk.nix
		./wm/hyprland.nix

		./services/nextcloud.nix
		./services/darkman.nix

		./programs/git.nix
		./programs/tmux.nix
		./programs/pogit.nix
		./programs/kitty.nix
		./programs/direnv.nix
		./programs/fastfetch.nix
		./programs/shell/zsh.nix

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

	nixpkgs = {
		config = {
			allowunfree = true;
			allowunfreepredicate = (_: true);
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
