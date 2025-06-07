{
  inputs,
  config,
  lib,
  ...
}:
let
  cli-conf = lib.mkIf config.cli.enable {
    tmux.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
    pogit.enable = lib.mkDefault true;
  };
  gui-conf = lib.mkIf config.gui.enable {
    cli.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault true;
  };
in
{
  imports = [
    ./cli
    ./gui
    inputs.catppuccin.homeModules.catppuccin
      inputs.pogit.homeManagerModules.default
  ];

  options = {
    cli.enable = lib.mkEnableOption "Can be used to enable all the default cli configs i got";
    gui.enable = lib.mkEnableOption "Can be used to enable all the default gui configs i got. It also enable `default.cli`";
  };

  config = lib.mkMerge [
    cli-conf
    gui-conf
  ];

}
