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
			lock = "ft-lock";
			kty-frappe = "kitten themes --reload-in=all Catppuccin-frappe";
			kty-latte = "kitten themes --reload-in=all Catppuccin-latte";
			code = "flatpak run com.visualstudio.code";
			powershell = "nix-shell -p powershell --run pwsh";
			kbus = "setxkbmap -layout us -variant intl";
			light-theme = "kitten themes --reload-in=all Catppuccin-latte && gsettings set org.gnome.desktop.interface color-scheme prefer-light && gsettings set org.gnome.desktop.interface gtk-theme Adwaita";
			dark-theme = "kitten themes --reload-in=all Catppuccin-frappe && gsettings set org.gnome.desktop.interface color-scheme prefer-dark && gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark";
		};
		initExtraFirst = ''
bgs() {
	if [[ "$#" -eq 1 && "$1" != -* ]]; then
		command nix-shell -p brightnessctl --run "brightnessctl set $1"
	else
		command nix-shell -p brightnessctl --run "brightnessctl set 80"
	fi
}
vol() {
	if [[ "$#" -eq 1 && "$1" != -* ]]; then
		command pactl set-sink-volume 0 $1%
	else
		command pactl set-sink-volume 0 0%
	fi
}
		'';
	};

}
