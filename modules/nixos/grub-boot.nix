{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    keyzox.grub-boot.enable = lib.mkEnableOption "to enable boot with grub";
  };

  config = lib.mkIf config.keyzox.grub-boot.enable {
    boot.loader.grub = {
      device = lib.mkDefault "nodev";
      enable = true;
      efiSupport = lib.mkDefault true;
      useOSProber = lib.mkDefault false;
    };
  };
}
