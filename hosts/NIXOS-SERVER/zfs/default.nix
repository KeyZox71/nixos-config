{ pkgs, ... }:

{
  imports = [
    ./service.nix
    ./sanoid.nix
  ];
  boot.zfs = {
    package = pkgs.zfs_unstable;
    extraPools = [ "BigBoyy" ];
  };
  boot = {
    supportedFilesystems = [ "zfs" ];
    kernelParams = [
      "zfs.zfs_arc_max=12884901888"
    ];
  };
}
