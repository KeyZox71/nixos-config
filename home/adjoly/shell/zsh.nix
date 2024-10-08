{ ... }:
{
	imports = [
		./zsh-config.nix
	];
	shellAliases = {
		l = "ls -lA --color=auto";
		ls = "ls -A --color=auto";
		re = "sudo nixos-rebuild switch";
		update = "sudo nix flake update && sudo nixos-rebuild switch";
		grep = "grep --color=auto";
		lock = "swaylock & systemctl suspend";
	};
	programs.zsh.initExtraFirst = ''
		path+=('/home/adjoly/.local/bin')
	'';
}
