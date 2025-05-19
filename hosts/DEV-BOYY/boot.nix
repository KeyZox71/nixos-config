{ lib, ... }:

{
  boot = {
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
