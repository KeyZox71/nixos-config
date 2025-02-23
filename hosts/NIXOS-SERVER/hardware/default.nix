{ config, ... }:
{
  imports = [
    ./disk-part.nix
    ./hardware-configuration.nix
  ];

  hardware = {
    nvidia-container-toolkit.enable = true;
    nvidia = {
			package = config.boot.kernelPackages.nvidiaPackages.stable;
			open = false;
		};
    graphics = {
      enable = true;
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
