{
  lib,
  config,
  ...
}:

{
  options = {
    keyzox.theme.enable = lib.mkEnableOption "Can be used to enable catppuccin";
  };

  config = lib.mkIf config.keyzox.theme.enable {
    catppuccin = {
      enable = true;
      cache.enable = true;
      flavor = "macchiato";
      accent = "lavender";
    };
  };
}
