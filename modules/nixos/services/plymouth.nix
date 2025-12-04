{
  lib,
  config,
  ...
}:
{
  options = {
    keyzox.services.plymouth.enable = lib.mkEnableOption "Can be used to enable plymouth";
  };

  config = lib.mkIf config.keyzox.services.plymouth.enable {
    boot.plymouth = {
      enable = true;
    };
  };
}
