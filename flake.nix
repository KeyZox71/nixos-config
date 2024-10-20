{
	description = "KeyZox's config";

	outputs = inputs@{ nixpkgs, catppuccin, home-manager, nixos-hardware, ... }: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
		nixosConfigurations = {
			LAPTOP-5530-ADAM = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [
					./hosts/LAPTOP-5530-ADAM/default.nix

					catppuccin.nixosModules.catppuccin
					
					nixos-hardware.nixosModules.common-gpu-intel
					nixos-hardware.nixosModules.dell-precision-5530
					nixos-hardware.nixosModules.common-gpu-nvidia-disable
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
				extraSpecialArgs = { inherit inputs; };
			};
			"wsladjoly" = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages."x86_64-linux";
				modules = [
					./home/adjoly/homewsl.nix
					{
						home = {
							homeDirectory = "/home/adjoly";
							username = "adjoly";
						};
					}
				];
				extraSpecialArgs = { inherit inputs; };
			};
		};
		perSystem = { pkgs, ... }:
		{
			devShells.default = pkgs.mkShell { } {
				packages = with pkgs; [
					nil
				];
			};
		};
	};
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

		unstablepkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		nixos-hardware.url = "github:NixOS/nixos-hardware/master";

		catppuccin.url = "github:catppuccin/nix";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		keyznvim.url = "github:keyzox71/nvim";

		pogit = {
			url = "github:y-syo/pogit";
			inputs.nixpkgs.follows = "nixpkgs"; # to use your nixpkgs instance instead of the provided one
		};

		flake-parts.url = "github:hercules-ci/flake-parts";
		
		hyprland-contrib = {
			url = "github:hyprwm/contrib";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
}
