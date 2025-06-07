{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    dunst.enable = lib.mkEnableOption "Can be used to enable dunst";
  };

  config = lib.mkIf config.dunst.enable {
    services.dunst = {
      enable = true;
    };
  };
}
