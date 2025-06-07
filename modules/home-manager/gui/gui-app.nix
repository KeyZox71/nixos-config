{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  options = {
    gui-app.enable = lib.mkEnableOption "Can be used to install the default gui app";
  };

  config = lib.mkIf config.gui-app.enable {
    home.packages = with pkgs; [
      vlc
      slack
      discord
      firefox
      obsidian
      localsend
      gearlever # for beeper cause the one from the nixpkgs seems bugged
      libreoffice
      inputs.zen-browser.packages.${pkgs.system}.default # TODO: move it to home conf
      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast # TODO: move it to home conf

      xfce.thunar # TODO: move it to home conf
      xfce.thunar-volman
      xfce.thunar-archive-plugin
      xfce.thunar-media-tags-plugin
    ];
  };
}
