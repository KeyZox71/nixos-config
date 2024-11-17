{ pkgs, inputs, outputs, ... }:

{
	imports =
		[ 
			./env.nix
			./boot.nix
			./fonts.nix
			./wireguard.nix
			./virtualbox.nix
			./services/sddm.nix
			./services/sound.nix
			./services/network.nix
			./services/xserver.nix
			./programs/hyprland.nix
			./hardware/hardware-configuration.nix

			inputs.home-unstable.nixosModules.home-manager
		];

	nixpkgs = {
		config = {
			allowUnfree = true;
		};
	};
 
	qt = {
		enable = true;
		platformTheme = "qt5ct";
	};
	
	security.pam.services.hyprlock = {};

	programs.dconf.enable = true;

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	environment.variables = {
		QT_STYLE_OVERRIDE = "Fusion";
		QT_QPA_PLATFORM = "wayland";
		GDK_BACKEND = "wayland";
		NIXOS_OZONE_WL = "1";
		CLUTTER_BACKEND = "wayland";
		KITTY_ENABLE_WAYLAND = "1";
	};

	programs.zsh.enable = true;
	
	programs.ssh.startAgent = true;
	programs.seahorse.enable = true;
	services.gnome.gnome-keyring.enable = true;
	
	hardware.bluetooth.enable = true; # enables support for Bluetooth
	hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

	users.users.adjoly = {
		shell = pkgs.zsh;
		isNormalUser = true;
		extraGroups = [ "docker" "audio" "video" "input" "networkmanager" "wheel" "sudo" "vboxusers" ];
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
		gh
		git
		zsh
		nil
		vim 
		wget
		curl
		btop
		unzip
		bluetuith
		cifs-utils
		xfce.thunar
		wl-clipboard
		brightnessctl
		docker-compose
		xfce.thunar-volman
		xfce.thunar-archive-plugin
		xfce.thunar-media-tags-plugin
		inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
	];

	nixpkgs.config.permittedInsecurePackages = [
		"electron-25.9.0"
	];

	home-manager = {
		useUserPackages = true;
		extraSpecialArgs = { inherit inputs outputs; };
		users.adjoly = import ../../home/adjoly/home.nix;
	};

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "24.05"; # Did you read the comment?
}
