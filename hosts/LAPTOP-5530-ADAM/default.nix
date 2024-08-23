{ config, pkgs, inputs, lib, outputs, ... }:

{
	imports =
		[ 
			./programs/hyprland.nix
			./hardware/nvidia.nix
			./hardware/hardware-configuration.nix
			./services/sound.nix
			./services/xserver.nix
			./services/network.nix
			./services/sddm.nix
			./boot.nix
			./env.nix
		];

	nixpkgs.config.allowUnfree = true;
 
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	programs.zsh.enable = true;

	users.users.adjoly = {
		shell = pkgs.zsh;
		isNormalUser = true;
		extraGroups = [ "docker" "audio" "video" "input" "networkmanager" "wheel" "sudo" ];
	};

	virtualisation.docker.enable = true;

	catppuccin = {
		enable = true;
		flavor = "frappe";
		accent = "lavender";
	#	pointerCursor = {
	#		enable = true;
	#		accent = "lavender";
	#		flavor = "frappe";
	#	};
	};

	environment.systemPackages = with pkgs; [
		vim 
		wget
		curl
		git
		gh
		inputs.yosyo.packages."${pkgs.system}".pogit
		zsh
		docker-compose
		btop
		cider
		brightnessctl
		bluetuith
		unzip
		xfce.thunar
		xfce.thunar-volman
		xfce.thunar-archive-plugin
		xfce.thunar-media-tags-plugin
		wl-clipboard
	];

	nixpkgs.config.permittedInsecurePackages = [
		"electron-25.9.0"
	];


	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.05"; # Did you read the comment?
}
