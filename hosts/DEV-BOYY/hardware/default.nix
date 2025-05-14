{ config, lib, ... }:

{
	imports = [
		./hardware-configuration.nix
	];

	hardware = {
		graphics = {
			enable = true;
			enable32Bit = true;
		};

		nvidia = {
			modesetting.enable = true;
			nvidiaSettings = true;
			open = true;
			package = config.boot.kernelPackages.nvidiaPackages.stable;
		};
	};

}
