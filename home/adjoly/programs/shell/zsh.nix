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
		shellAliases = {
			l = "ls -lA --color=auto";
			ls = "ls -A --color=auto";
			re = "nh os switch /home/adjoly/nixos-config";
			update = "sudo nix flake update && sudo nixos-rebuild switch";
			grep = "grep --color=auto";
			lock = "hyprlock & systemctl suspend";
			hibernate = "hyprlock & systemctl hibernate";
		};
	};
}
