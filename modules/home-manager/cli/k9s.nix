{
  config,
  lib,
  ...
}:

{
  options = {
    keyzox.k9s.enable = lib.mkEnableOption "Can be used to enable my k9s config";
  };

  config = lib.mkIf config.keyzox.k9s.enable {
    catppuccin.k9s = {
      enable = true;
      transparent = true;
    };
    programs.k9s = {
      enable = true;
    };
  };
}
