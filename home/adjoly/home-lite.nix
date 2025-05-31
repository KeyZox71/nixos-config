{ inputs, pkgs, ... }:
{
	imports = [
		../../modules/home-manager

		./gtk.nix
		./cli-app.nix
		./wm/hyprland.nix
		./themes/catppuccin.nix

		./unstable-overlay.nix

		./services/nextcloud.nix
		./services/darkman.nix

		./programs/git.nix
		./programs/pogit.nix
		./programs/kitty.nix
		./programs/neovim.nix
		./programs/direnv.nix
		./programs/fastfetch.nix
		./programs/shell/zsh.nix

		inputs.catppuccin.homeManagerModules.catppuccin
	];

	config.tmux.enable = true;

	home = {
		packages = with pkgs; [
			beeper
			zenity
			hyprpaper
		];
		stateVersion = "24.05";
	};
}
