{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  options = {
    keyzox.gui-app.enable = lib.mkEnableOption "Can be used to install the default gui app";
  };

  config = lib.mkIf config.keyzox.gui-app.enable {
    home.packages = with pkgs; [
      vlc
      slack
      beeper
      discord
      firefox
      localsend
      gearlever
      parsec-bin
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.hyprland-contrib.packages.${pkgs.stdenv.hostPlatform.system}.grimblast

      xfce.thunar
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin
    ];
  };
}
