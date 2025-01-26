{ inputs, pkgs, ... }:
{
	imports = [
		./cli-app.nix
		./themes/catppuccin.nix

		./unstable-overlay.nix

		./programs/git.nix
		./programs/tmux.nix
		./programs/pogit.nix
		./programs/neovim.nix
		./programs/direnv.nix
		./programs/fastfetch.nix
		./programs/shell/zsh.nix

		inputs.catppuccin.homeManagerModules.catppuccin
	];

	home = {
		packages = with pkgs; [
		];
		stateVersion = "24.05";
	};
}
