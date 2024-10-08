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
				catppuccin = {
					enable = true;
					flavor = "frappe";
				};
			};
		};
		blacklistedKernelModules = [
			"nouveau"
		];
	};
}
