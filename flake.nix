{
	description = "KeyZox's config";
	inputs = {
		nixos-hardware.url = "github:NixOS/nixos-hardware/master";

		catppuccin.url = "github:catppuccin/nix";

		home-manager = {
			url = "github:nix-community/home-manager/release-24.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

		unstablepkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		
		yosyo.url = "github:y-syo/.nixos-config/ReiAyanami";
	};

	outputs = inputs@{ self, nixpkgs, catppuccin, home-manager, nixos-hardware, ... }:
	 let
		inherit (self) outputs;
		systems = [ "x86_64-linux" ];
		forSystems = nixpkgs.lib.genAttrs systems;
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
					nixos-hardware.nixosModules.common-gpu-nvidia-disable
					home-manager.nixosModules.home-manager
					{
						home-manager.users.adjoly= {
							imports = [
								./home/adjoly/home.nix
								catppuccin.homeManagerModules.catppuccin
							];
						};
					}
				];
			};
			homeConfigurations.adjoly = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.x86_64-linux;
				modules = [
					./home/adjoly/home.nix
					catppuccin.homeManagerModules.catppuccin
				];
			};
		};
	};
}
