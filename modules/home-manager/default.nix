{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  cli-conf = lib.mkIf config.keyzox.cli.enable {
    keyzox.tmux.enable = lib.mkDefault true;
    keyzox.git.enable = lib.mkDefault true;
    keyzox.pogit.enable = lib.mkDefault true;
    keyzox.shell.enable = lib.mkDefault true;
    keyzox.cli-app.enable = lib.mkDefault true;
  };
  gui-conf = lib.mkIf config.keyzox.gui.enable {
    keyzox.cli.enable = lib.mkDefault true;
    keyzox.kitty.enable = lib.mkDefault true;
    keyzox.nextcloud.enable = lib.mkDefault true;
    keyzox.darkman.enable = lib.mkDefault true;
    keyzox.dunst.enable = lib.mkDefault true;
    keyzox.hyprlock.enable = lib.mkDefault true;
    keyzox.hyprland.enable = lib.mkDefault true;
    keyzox.wl-sunset.enable = lib.mkDefault true;
	keyzox.gui-app.enable = lib.mkDefault true;
  };
in
{
  imports = [
    ./cli
    ./gui

    ./catppuccin.nix

    inputs.catppuccin.homeModules.catppuccin
    inputs.pogit.homeManagerModules.default
  ];

  options = {
    keyzox.cli.enable = lib.mkEnableOption "Can be used to enable all the default cli configs i got";
    keyzox.gui.enable = lib.mkEnableOption "Can be used to enable all the default gui configs i got. It also enable `default.cli`";
  };

  config = lib.mkMerge [
    cli-conf
    gui-conf
  ];

}
