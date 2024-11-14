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
		overlays = [
			(final: prev: {
				unstable = import inputs.unstablepkgs {
					system = pkgs.system;
					config.allowUnfree = true;
				};
			})
		];
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
			discord
			obsidian
			starship
			ticktick
			unstable.vivaldi
			vivaldi-ffmpeg-codecs
		];
		stateVersion = "24.05";
	};
}
