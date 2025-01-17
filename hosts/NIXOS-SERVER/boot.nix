{ pkgs, lib, config, inputs, outputs, ... }:

{
	boot = {
		loader = {
			efi = {
				canTouchEfiVariables = true;
				efiSysMountPoint = "/boot";
			};
			grub = {
				device = "nodev";
				enable = true;
				efiSupport = true;
				useOSProber = true;
			};
		};
		blacklistedKernelModules = [
			"nouveau"
		];
		kernelModules = [
			"lpfc"
			"qla2xxx"
		];
	};
}
