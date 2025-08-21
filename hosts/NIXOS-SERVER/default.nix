{
  pkgs,
  config,
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

  keyzox = {
    defaults = true;

    grub-boot.enable = true;
    theme.enable = true;

    hardware = {
      nvidia.enable = true;
    };
    programs = {
      docker.enable = true;
      docker.rootless = true;
    };
    services = { };
  };
  virtualisation.docker.daemon.settings.features.cdi = true;
  hardware.nvidia-container-toolkit.enable = true;

  system.stateVersion = "24.11"; # Did you read the comment?
}
