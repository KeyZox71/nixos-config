{
  config,
  lib,
  pkgs,
  ...
}:

let
  source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/KeyZox71/nixos-config/refs/heads/master/assets/DSC_4763.jpg";
    sha256 = "EZJ0lJkHMTzvymiMtMzcKeoTB1kUU7rRC24mzeRWmGg=";
  };
in
{
  options = {
    keyzox.hyprpaper.enable = lib.mkEnableOption "";
  };

  config = lib.mkIf config.keyzox.hyprpaper.enable {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ "${source}" ];
        wallpaper = [ ", ${source}" ];
      };
    };
  };
}
