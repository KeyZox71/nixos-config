{
  description = "KeyZox's config";

  outputs =
    inputs@{
      self,
      nixpkgs,
      catppuccin,
      home-manager,
      nixos-hardware,
      disko,
      lanzaboote,
      nixos-generators,
      ...
    }:
    let
      inherit (self) outputs;
      supportedSystems = [
        "x86_64-linux"
        "x86_64-darwin"
      ];
      forEachSupportedSystem =
        f:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import nixpkgs { inherit system; };
            system = system;
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
            self.nixosModules.default
          ];
        };
        LAPTOP-5530 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs self; };
          modules = [
            ./hosts/LAPTOP-5530/default.nix

            disko.nixosModules.disko
            catppuccin.nixosModules.catppuccin
            nixos-hardware.nixosModules.dell-precision-5530
            self.nixosModules.default
          ];
        };
        nixos-server = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs self; };
          modules = [
            ./hosts/NIXOS-SERVER/default.nix

            inputs.disko.nixosModules.disko
            self.nixosModules.default
            catppuccin.nixosModules.catppuccin
          ];
        };
      };
      homeConfigurations = {
        "42adjoly" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit self; };
          modules = [
            ./home/42/default.nix
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
        { pkgs, system }:
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
        { pkgs, system }:
        let
          nixvim = inputs.nixvim.legacyPackages.${system};
        in
        {
          adjust-brightness = import ./pkgs/adjust-brightness { inherit pkgs; };
          keyznvim = pkgs.callPackage ./pkgs/keyznvim {
            nixvim = nixvim;
            liteMode = false;
			home = "";
			inherit inputs outputs self;
          };
          keyznvim-lite = pkgs.callPackage ./pkgs/keyznvim {
            nixvim = nixvim;
            liteMode = true;
			home = "";
			inherit inputs outputs self;
          };
          virtualBoyy =
            {
              mount-enabled ? false,
            }:
            let
              generate-vm =
                modules:
                nixos-generators.nixosGenerate {
                  inherit modules system;
                  specialArgs = {
                    inherit
                      pkgs
                      inputs
                      self
                      outputs
                      ;
                  };
                  format = "vm";
                };
              mount = {
                systemd.services.mount-work = {
                  description = "Mount the shared folder";
                  # fstab entry:
                  #  host0   /wherever    9p      trans=virtio,version=9p2000.L   0 0
                  script = ''
                    					  mkdir -p /work
                    					  /run/wrappers/bin/mount -t 9p -o trans=virtio,version=9p2000.L host0 /work
                    				  '';
                  wantedBy = [ "multi-user.target" ];
                  after = [ "network.target" ];
                  serviceConfig = {
                    Type = "oneshot";
                    RemainAfterExit = true;
                  };
                };
              };
              vm = generate-vm [
                self.nixosModules.default
                catppuccin.nixosModules.catppuccin
                ./hosts/VM/default.nix
                (nixpkgs.lib.optionalAttrs mount-enabled mount)
              ];
            in
            vm;
        }
      );

      homeModules = {
        default = import ./modules/home-manager;
        gui = import ./modules/home-manager/gui;
        cli = import ./modules/home-manager/cli;
      };

      nixosModules = {
        default = import ./modules/nixos;
        services = import ./modules/nixos/services;
        hardware = import ./modules/nixos/hardware;
        programs = import ./modules/nixos/programs;
      };

      nixvimModules = {
        default = import ./modules/nixvim;
        servers = import ./modules/nixvim/servers;
      };

      apps = forEachSupportedSystem (
        { pkgs, system }:
        {
          virtualBoyy =
            let
              scriptName = "run-virtualBoyy-vm";
              script = pkgs.writeShellScriptBin "${scriptName}" ''
                ${self.packages.${system}.virtualBoyy { mount-enabled = false; }}/bin/run-virtualBoyy-vm \
                -enable-kvm \
                -m 8G \
                -smp 4\
              '';
            in
            {
              type = "app";
              program = "${script}/bin/${scriptName}";
            };

          virtualBoyy-headless =
            let
              scriptName = "run-virtualBoyy-vm-headless";
              script = pkgs.writeShellScriptBin "${scriptName}" ''
                ${self.packages.${system}.virtualBoyy { mount-enabled = false; }}/bin/run-virtualBoyy-vm \
                -enable-kvm \
                -nographic \
                -m 8G \
                -smp 4\
              '';
            in
            {
              type = "app";
              program = "${script}/bin/${scriptName}";
            };
        }
      );
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    unstablepkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:keyzox71/nixos-hardware/master";

    catppuccin = {
      url = "github:catppuccin/nix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
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

    randomTimer = {
      url = "github:keyzox71/randomTimer";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
}
