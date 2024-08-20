{ inputs, outputs, lib, config, pkgs, theme, ... }:

{
	imports = [

		./dev.nix

		./config/zsh.nix
		./config/tmux.nix

	];
	programs = {
		git = {
			enable = true;
			userName = "adjoly";
			userEmail = "adjoly@student.42angouleme.fr";
		};
		gh = {
			enable = true;
			settings = {
				git_protocol = "ssh";
			};
		};
		home-manager.enable = true;
	};

#	services.nextcloud-client = {
#		enable = false;
#		startInBackground = false;
#	};

	nixpkgs = {
		config = {
			allowUnfree = true;
			allowUnfreePredicate = (_: true);
		};
	};

	home = {
		packages = with pkgs; [
			#obsidian
			ripgrep
			vivaldi
			vivaldi-ffmpeg-codecs
			discord
			tmux
			beeper
			neovim
			ncdu
		];
		stateVersion = "24.05";
		username = "adjoly";
		homeDirectory = "/nfs/homes/adjoly";
	};
}
