{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    keyzox.services.gdm.enable = lib.mkEnableOption "To enable gdm";
  };

  config = lib.mkIf config.keyzox.services.gdm.enable {
    services.xserver.displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };
}
