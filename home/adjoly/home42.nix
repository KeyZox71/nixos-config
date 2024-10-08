{ inputs, outputs, lib, config, pkgs, theme, ... }:

{
	imports = [
		./config/dev.nix

		./shell/zsh42.nix
		./config/tmux.nix

		./programs/git.nix
		./programs/pogit.nix

		inputs.catppuccin.homeManagerModules.catppuccin
	];
	programs.home-manager.enable = true;

	nixpkgs = {
		config = {
			allowUnfree = true;
			allowUnfreePredicate = (_: true);
		};
	};

	catppuccin = {
		enable = true;
		flavor = "frappe";
		accent = "lavender";
	};

	home = {
		packages = with pkgs; [
			#obsidian
			starship
			ripgrep
			vivaldi
			vivaldi-ffmpeg-codecs
			discord
			beeper
			neovim
			ncdu
			#libclang
		];
		stateVersion = "24.05";
	};
}
