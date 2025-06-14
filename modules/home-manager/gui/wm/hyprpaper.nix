{
  config,
  lib,
  pkgs,
  ...
}:

let
  source = pkgs.fetchurl {
    url = "https://drive.kanel.ovh/s/e9Hqxi85gsSoZg5/download/DSC_4763.jpg";
    sha256 = "0s4qavjcs9kf1g8vllqlb43i7si9vk6b9338rbpkqc87k6a794hi";
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
