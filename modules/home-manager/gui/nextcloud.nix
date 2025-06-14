{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    keyzox.nextcloud.enable = lib.mkEnableOption "Can be use to enable my nextcloud config";
  };

  config = lib.mkIf config.keyzox.nextcloud.enable {
    services.nextcloud-client = {
      enable = true;
      startInBackground = true;
    };
  };
}
