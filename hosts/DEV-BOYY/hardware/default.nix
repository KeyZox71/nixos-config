{ ... }:

{
	imports = [
		./hardware-configuration.nix
	];
	hardware.nvidia.open = true;
}
