{ inputs, config, lib, ... }:
let
  cli-conf = lib.mkIf config.cli.enable {
    tmux.enable = lib.mkDefault true;
    git.enable = lib.mkDefault true;
  };
  gui-conf = lib.mkIf config.gui.enable {
    cli.enable = true;
    kitty.enable = true;
  };
in
{
  imports = [
    ./cli
    ./gui
    inputs.catppuccin.homeModules.catppuccin
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
