{ inputs, pkgs, ... }:

{
	imports = [

		./programs/git.nix
		./programs/tmux.nix
		./programs/pogit.nix
		./programs/neovim.nix
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
	nix.nixPath = [ "nixpkgs=${inputs.unstablepkgs}" ];

	catppuccin = {
		enable = true;
		flavor = "frappe";
		accent = "lavender";
	};

	home = {
		packages = with pkgs; [
			beeper
			vivaldi
			discord
			obsidian
			starship
			ticktick
			vivaldi-ffmpeg-codecs
		];
		stateVersion = "24.05";
	};
}
