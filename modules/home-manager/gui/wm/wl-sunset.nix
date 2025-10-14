{
  lib,
  config,
  ...
}:

{
  options = {
    keyzox.wl-sunset.enable = lib.mkEnableOption "Can be used to enable wl-sunset";
  };

  config = lib.mkIf config.keyzox.wl-sunset.enable {
    services.wlsunset = {
      enable = true;
      latitude = 45.64;
      longitude = 0.16;
      temperature = {
        day = 6500;
        night = 3500;
      };
    };
  };
}
