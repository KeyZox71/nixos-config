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
      lanzaboote,
      ...
    }:
    let
      inherit (self) outputs;
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
          }
        );

    in
    {
      nixosConfigurations = {
        DEV-BOYY = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs self; };
          modules = [
            ./hosts/DEV-BOYY/default.nix

            catppuccin.nixosModules.catppuccin
            lanzaboote.nixosModules.lanzaboote
          ];
        };
        LAPTOP-5530 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/LAPTOP-5530/default.nix

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
      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              nixd
              nixfmt-rfc-style
            ];
          };
        }
      );
      packages = forEachSupportedSystem (
        { pkgs }:
        {
          adjust-brightness = import ./pkgs/adjust-brightness { inherit pkgs; };
        }
      );

      homeModules = {
        default = import ./modules/home-manager;
        gui = import ./modules/home-manager/gui;
        cli = import ./modules/home-manager/cli;
      };

    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    unstablepkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:keyzox71/nixos-hardware/master";

    catppuccin.url = "github:catppuccin/nix";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
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
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    timmy = {
      url = "github:keyzox71/timmy";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nh = {
      url = "github:nix-community/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

}
