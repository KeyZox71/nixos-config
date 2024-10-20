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
			re = "~/home-manager";
			grep = "grep --color=auto";
			powershell = "nix-shell -p powershell --run pwsh";
		};
		initExtraFirst = ''
		'';
	};

}
