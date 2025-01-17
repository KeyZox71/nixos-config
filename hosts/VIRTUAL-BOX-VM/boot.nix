{ ... }:

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
			};
		};
		blacklistedKernelModules = [
			"nouveau"
		];
		kernelModules = [
		];
	};
}
