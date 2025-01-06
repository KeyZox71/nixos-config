{
	description = "KeyZox's config";
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

		unstablepkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		nixos-hardware.url = "github:keyzox71/nixos-hardware/master";

		catppuccin.url = "github:catppuccin/nix";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		fastclass.url = "github:seekrs/fastclass/nixxing";

		home-unstable = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "unstablepkgs";
		};

		keyznvim = {
			url = "github:keyzox71/nvim/indev";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		pogit = {
			url = "github:y-syo/pogit";
			inputs.nixpkgs.follows = "nixpkgs"; # to use your nixpkgs instance instead of the provided one
		};
		
		hyprland-contrib = {
			url = "github:hyprwm/contrib";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		zen-browser = {
			url = "github:keyzox71/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		timmy = {
			url = "github:keyzox71/timmy";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		disko = {
			url = "github:nix-community/disko";
		};
	};

	outputs = inputs@{ self, nixpkgs, catppuccin, home-manager, nixos-hardware, ... }:
	 let
		supportedSystems = [ "x86_64-linux" "x86_64-darwin" ];
		forSystems = nixpkgs.lib.genAttrs supportedSystems;
		inherit (self) outputs;
	in
	{
		nixosConfigurations = {
			LAPTOP-5530-ADAM = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs outputs; };
				modules = [
					./hosts/LAPTOP-5530-ADAM/default.nix

					catppuccin.nixosModules.catppuccin
					
					nixos-hardware.nixosModules.dell-precision-5530
				];
			};
			NIXOS-SERVER = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs outputs; };
				modules = [
					inputs.disko.nixosModules.disko
					./hosts/NIXOS-SERVER/default.nix
					./hardware-configuration.nix
				];
			};
		};
		homeManagerConfigurations = {
			"42adjoly" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages."x86_64-linux";
				modules = [
					./home/adjoly/home42.nix
					{
						home = {
							homeDirectory = "/nfs/homes/adjoly";
							username = "adjoly";
						};
					}
				];
				extraSpecialArgs = { inherit inputs outputs; };
			};
		};
	};
}
