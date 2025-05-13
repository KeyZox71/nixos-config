{
  description = "KeyZox's config";

  outputs =
    inputs@{
      self,
      nixpkgs,
      catppuccin,
      home-manager,
      nixos-hardware,
      nixos-wsl,
      disko,
      ...
    }:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations = {
        DEV-BOYY = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/DEV-BOYY/default.nix

            disko.nixosModules.disko
            catppuccin.nixosModules.catppuccin
			(import nixos-hardware + "/common/cpu/amd")
			(import nixos-hardware + "/common/gpu/nvidia/turing")
          ];
        };
        LAPTOP-5530-ADAM = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/LAPTOP-5530-ADAM/default.nix

            disko.nixosModules.disko
            catppuccin.nixosModules.catppuccin
            nixos-hardware.nixosModules.dell-precision-5530
          ];
        };
        nixos-server = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/NIXOS-SERVER/default.nix

            inputs.disko.nixosModules.disko
          ];
        };
        wsl-adjoly = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/WSL/default.nix

            nixos-wsl.nixosModules.default
            catppuccin.nixosModules.catppuccin
          ];

        };
      };
      homeConfigurations = {
        "42adjoly" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          modules = [
            ./home/adjoly/home42.nix
            {
              home = {
                homeDirectory = "/home/adjoly";
                username = "adjoly";
              };
            }
          ];
          extraSpecialArgs = { inherit inputs outputs; };
        };
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

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
      inputs.nixpkgs.follows = "nixpkgs";
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

}
