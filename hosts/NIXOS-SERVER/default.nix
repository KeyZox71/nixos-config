{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./services
    ./zfs

    ../home.nix

    ./disko.nix
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    overlays = [
      (_: _: {
        unstable = import inputs.unstablepkgs {
          system = pkgs.stdenv.hostPlatform.system;
          config.allowUnfree = true;
        };
      })
    ];
  };

  boot.kernelModules = [
    "lpfc"
    "qla2xxx"
  ];

  networking = {
    hostId = "49ff816f";
    hostName = "nixos-server";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  services.tailscale.extraUpFlags = [ "--ssh" ];

  virtualisation.docker = {
    # daemon.settings.features.cdi = true;
    storageDriver = "btrfs";
  };
  hardware.nvidia-container-toolkit.enable = true;

  keyzox = {
    defaults = true;

    grub-boot.enable = true;
    # theme.enable = true;

    hardware = {
      nvidia.enable = true;
    };
    programs = {
      docker.enable = true;
      docker.rootless = true;
    };
    services = { };
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
