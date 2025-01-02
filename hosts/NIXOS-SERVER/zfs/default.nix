{ pkgs, ... }:

{
	boot.zfs = {
		package = pkgs.zfs_unstable;
		extraPools = [ "BigBoyy" ];
	};

}
