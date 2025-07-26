{
  config,
  pkgs,
  lib,
  ...
}:

{

  options = {
    keyzox.hardware.logitech.enable = lib.mkEnableOption "To enabe logitech and solaar";
  };

  config = lib.mkIf config.keyzox.hardware.logitech.enable {
    hardware.logitech = {
      wireless = {
        enable = true;
        enableGraphical = true;
      };
    };
  };
}
