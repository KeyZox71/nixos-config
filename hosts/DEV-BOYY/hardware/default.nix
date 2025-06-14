{ config, lib, ... }:

{
	imports = [
		./hardware-configuration.nix
	];

	hardware = {
		nvidia = {
			modesetting = {
				enable = true;
			};
			nvidiaSettings = true;
			open = false;
			powerManagement = {
				enable = true;
			};
		};
	};

}
