{
  config,
  lib,
  ...
}:

{
  options = {
    keyzox.dunst.enable = lib.mkEnableOption "Can be used to enable dunst";
  };

  config = lib.mkIf config.keyzox.dunst.enable {
    services.dunst = {
      enable = true;
    };
  };
}
