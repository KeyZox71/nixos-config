{ pkgs, ... }:

{
	imports = [
		./service.nix
	];
	boot.zfs = {
		package = pkgs.zfs_unstable;
		extraPools = [ "BigBoyy" ];
	};
	boot.supportedFilesystems = [ "zfs" ];
}
