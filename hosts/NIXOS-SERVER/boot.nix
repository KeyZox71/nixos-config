{ pkgs, lib, config, inputs, outputs, ... }:

{
	boot = {
		loader = {
			efi = {
				canTouchEfiVariables = true;
				efiSysMountPoint = "/boot";
			};
			grub = {
				enable = true;
				efiSupport = true;
				device = "nodev";
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