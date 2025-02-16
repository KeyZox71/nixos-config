{ ... }:
{
  imports = [
    ./disk-part.nix
    ./hardware-configuration.nix
  ];

  hardware = {
		nvidia.package = "config.boot.kernelPackages.nvidiaPackages.stable";
    graphics = {
      enable = true;
    };
  };
}
