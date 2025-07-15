{ lib, ... }:

{
  boot = {
    kernelParams = [
      "video=DP-2:1920x1080@75"
    ];
    loader = {
      systemd-boot.enable = lib.mkForce false;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      # grub = {
      #   enable = false;
      #   efiSupport = true;
      #   device = "nodev";
      #   useOSProber = true;
      # };
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
    supportedFilesystems = [ "ntfs" ];
    blacklistedKernelModules = [
      "nouveau"
    ];
  };
}
