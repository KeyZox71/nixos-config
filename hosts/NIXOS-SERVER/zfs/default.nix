{ pkgs, ... }:

{
	imports = [
		./service.nix
	];
	boot.zfs = {
		package = pkgs.zfs_unstable;
		extraPools = [ "BigBoyy" "FatBoyy" ];
	};
	boot = {
		supportedFilesystems = [ "zfs" ];
		kernelParams = [
			"zfs.zfs_arc_max=12884901888"
		];
	};
}
