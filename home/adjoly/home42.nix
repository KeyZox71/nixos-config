{ inputs, outputs, lib, config, pkgs, theme, nixgl, ... }:

{
	imports = [

		./programs/git.nix
		./programs/tmux.nix
		./programs/pogit.nix
		./programs/direnv.nix
		./programs/shell/zsh42.nix

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
			obsidian
			starship
			ripgrep
			vivaldi
			vivaldi-ffmpeg-codecs
			discord
			beeper
			neovim
			ncdu
		];
		stateVersion = "24.05";
	};
}
