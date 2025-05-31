{ config, lib, ... }:
let
  cli-conf = lib.mkIf config.cli.enable {
    tmux.enable = lib.mkDefault true;
  };
  gui-conf = lib.mkIf config.gui.enable {
  };
in
{
  imports = [
    ./tmux.nix
  ];

  options = {
    cli = {
      enable = lib.mkOption {
        type = lib.types.bool;
        description = ''
          			Can be used to enable all the default cli configs i got
          			'';
        example = lib.literalExample true;
        default = false;
      };
    };
    gui = {
      enable = lib.mkOption {
        type = lib.types.bool;
        description = ''
          			Can be used to enable all the default gui configs i got.
          			It also enable `default.cli`
          			'';
        example = lib.literalExample true;
        default = false;
      };
    };
  };

  config = lib.mkMerge [
    cli-conf
    gui-conf
    (lib.mkIf config.gui.enable {
      cli.enable = true;
    })
  ];

}
