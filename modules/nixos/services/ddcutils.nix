{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    keyzox.services.ddcutils.enable = lib.mkEnableOption "to enable ddcutils";
  };

  config = lib.mkIf config.keyzox.services.ddcutils.enable {
    hardware.i2c.enable = true;
    users.groups.i2c = { };

    services.udev.extraRules = ''
      KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
    '';

    environment.systemPackages = with pkgs; [
      ddcui
      ddcutil
    ];

    services.udev.packages = with pkgs; [
      ddcutil
    ];
  };
}
