{
  config,
  lib,
  ...
}:

{
  options = {
    keyzox.services.ly.enable = lib.mkEnableOption "to enable ly session manager";
  };

  config = lib.mkIf config.keyzox.services.ly.enable {
    services.displayManager.ly = {
      enable = true;
      settings = {
        load = true;
        save = true;
        animation = "doom";
      };
    };
  };
}
