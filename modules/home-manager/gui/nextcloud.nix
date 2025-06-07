{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    nextcloud.enable = lib.mkEnableOption "Can be use to enable my nextcloud config";
  };

  config = lib.mkIf config.nextcloud.enable {
    services.nextcloud-client = {
      enable = true;
      startInBackground = true;
    };
  };
}
