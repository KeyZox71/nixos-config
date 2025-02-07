{ ... }:
{
	imports = [
		./zsh-config.nix
		./thefuck.nix
		./starship.nix
		./fzf.nix
		./zoxide.nix
	];
	programs.zsh = {
		initExtraFirst = ''
			path+=('/home/adjoly/.local/bin')
		'';
		shellAliases = {
			l = "ls -lA --color=auto";
			ls = "ls -A --color=auto";
			re = "sudo nixos-rebuild switch";
			update = "sudo nix flake update && sudo nixos-rebuild switch";
			grep = "grep --color=auto";
			lock = "hyprlock & systemctl suspend";
			hibernate = "hyprlock & systemctl hibernate";
		};
	};
}
