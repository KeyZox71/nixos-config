{ pkgs, ... }:

{
	home.packages = with pkgs; [
		gh
		git
		fzf
		tmux
		zoxide
		direnv
		ripgrep
		starship
		thefuck
		unstable.yazi
	];
}
