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
			re = "home-manager --flake ~/Documents/nixos-config#42adjoly switch";
			grep = "grep --color=auto";
			kty-frappe = "kitten themes --reload-in=all Catppuccin-frappe";
			kty-latte = "kitten themes --reload-in=all Catppuccin-latte";
			code = "flatpak run com.visualstudio.code";
			powershell = "nix-shell -p powershell --run pwsh";
			kbus = "setxkbmap -layout us -variant intl";
			tailup = "docker compose -f ~/workspace/test-tailscale/docker-compose.yml up -d && docker logs tailscale-42";
			tailscale = "docker exec -it tailscale-42 tailscale";
			tailscale-sh = "docker exec -it tailscale-42 sh";
			portup = "docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /run/user/101479/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts";
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
PATH+=":$HOME/.local/kitty.app/bin"
		'';
	};

}
