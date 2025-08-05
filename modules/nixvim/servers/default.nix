{
  inputs,
  lib,
  pkgs,
  config,
  ...
}:
{
  options = {
    keyzox.lsp.liteMode = lib.mkEnableOption "Can be used to enable 'liteMode' which does not install the packages of the lsp";
    keyzox.lsp.enabled = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [ ];
      example = [
        "clangd"
        "gopls"
      ];
      description = "Can be used to enable a list of lsp";
    };
  };

  config = lib.mkIf (config.keyzox.lsp.enabled != [ ]) {
    lsp.servers = builtins.listToAttrs (
      map (name: {
        name = name;
        value =
          if config.keyzox.lsp.liteMode then
            {
              enable = true;
              package = null;
            }
          else
            {
              enable = true;
            };
      }) config.keyzox.lsp.enabled
    );
  };
}
