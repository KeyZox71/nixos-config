{ config, pkgs, inputs, lib, outputs, ... }:

{
	imports =
		[ 
			inputs.home-manager.nixosModules.home-manager
			
			./hardware/nvidia.nix
			./hardware/hardware-configuration.nix
			./services/sound.nix
			./services/xserver.nix
			./services/network.nix
			./boot.nix
			./env.nix
		];

	nixpkgs.config.allowUnfree = true;
 
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	programs.zsh.enable = true;

	users.users.adjoly = {
		shell = pkgs.zsh;
		isNormalUser = true;
		extraGroups = [ "audio" "video" "input" "networkmanager" "wheel" "sudo" ];
	};

	environment.systemPackages = with pkgs; [
		vim 
		wget
		curl
		vivaldi
		git
		gh
		inputs.yosyo.packages."${pkgs.system}".pogit
		neovim
		signal-desktop
		nextcloud-client
		zsh
		nerdfonts
		beeper
		discord
		vivaldi-ffmpeg-codecs
		tmux
		btop
		gnome3.gnome-tweaks
		unzip
		wl-clipboard
		python311Packages.compiledb
		plex-media-player
	];

	home-manager = {
		useGlobalPkgs = true;
		useUserPackages = true;
		extraSpecialArgs = { inherit inputs; };
		users.adjoly = import ../../home/adjoly/home.nix;
	};

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "23.11"; # Did you read the comment?

}
