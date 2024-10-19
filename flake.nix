{
	description = "KeyZox's config";
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
		
		hyprland-contrib = {
			url = "github:hyprwm/contrib";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ self, keyznvim, nixpkgs, catppuccin, home-manager, nixos-hardware, ... }:
	 let
		supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
		forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
			pkgs = import nixpkgs {
				inherit system; 
			};
		});
	in
	{
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
		};
		devShells = forEachSupportedSystem ({ pkgs }: {
			default = pkgs.mkShell.override
			{}
			{
				packages = with pkgs; [
					nil
				];
			};
		});
	};
}
