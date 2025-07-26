{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    keyzox.programs.app-image.enable = lib.mkEnableOption "to enable appimage support";
  };

  config = lib.mkIf config.keyzox.programs.app-image.enable {
    programs.appimage = {
      enable = true;
      binfmt = true;
    };
  };
}
