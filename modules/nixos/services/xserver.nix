{
  config,
  lib,
  ...
}:

{
  options = {
    keyzox.services.xserver.enable = lib.mkEnableOption "to enable xserver";
  };

  config = lib.mkIf config.keyzox.services.xserver.enable {
    services.xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "intl";
      };
    };
    services.libinput = {
      enable = lib.mkDefault true;
      mouse.accelProfile = "flat";
    };
  };
}
