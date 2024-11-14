{ inputs, pkgs, ... }:
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
		./programs/neovim.nix
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
			allowUnfree = true;
			allowUnfreepredicate = (_: true);
		};
		overlays = [
			(final: prev: {
				unstable = import inputs.unstablepkgs {
					system = pkgs.system;
					config.allowUnfree = true;
				};
			})
		];
	};

	home = {
		packages = with pkgs; [
			vlc
			tmux
			beeper
			ripgrep
			molotov
			discord
			obsidian
			playerctl
			hyprpaper
			parsec-bin
			libreoffice
			tradingview
			prismlauncher
			nextcloud-client
			unstable.vivaldi
			plex-media-player
			vivaldi-ffmpeg-codecs
		];
		stateVersion = "24.05";
	};
}
