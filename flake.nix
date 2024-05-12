{
  description = "KeyZox's config";
  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

	  unstablepkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
	  yosyo.url = "github:y-syo/.nixos-config/ReiAyanami";
  };

	outputs = inputs@{ self, nixpkgs, nixos-hardware, ... }:
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
          nixos-hardware.nixosModules.dell-precision-5530
          nixos-hardware.nixosModules.common-gpu-nvidia-disable
          "./hosts/LAPTOP-5530-ADAM/default.nix"
        ];
      };
	  };
  };
}