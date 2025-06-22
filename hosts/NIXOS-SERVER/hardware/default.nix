{ config, ... }:
{
  imports = [
    ./disk-part.nix
    ./hardware-configuration.nix
  ];

  hardware = {
    #nvidia-container-toolkit.enable = true;
    nvidia = {
		    modesetting.enable = true;
			powerManagement.finegrained = false;
			powerManagement.enable = false;
			package = config.boot.kernelPackages.nvidiaPackages.beta;
			open = false;
	};
    graphics = {
      enable = true;
    };
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
