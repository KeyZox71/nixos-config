{
  config,
  lib,
  ...
}:

{
  options = {
    keyzox.services.gdm.enable = lib.mkEnableOption "To enable gdm";
  };

  config = lib.mkIf config.keyzox.services.gdm.enable {
    services.displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
