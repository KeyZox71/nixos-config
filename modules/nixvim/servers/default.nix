{
  inputs,
  lib,
  pkgs,
  config,
  ...
}:

let
  inherit (config.keyzox.lsp) serversPath;

  serverSettingsPath = name: "${toString serversPath}/${name}.nix";

  generateLspConfig =
    name:
    let
      path = serverSettingsPath name;
      hasCustomSettings = builtins.pathExists path;
      settingsPart =
        if hasCustomSettings then
          {
            settings = import path;
          }
        else
          {
          };
      baseConfig =
        if config.keyzox.lsp.liteMode then
          {
            enable = true;
            package = null;
          }
        else
          {
            enable = true;
          };
    in
    lib.mkMerge [
      settingsPart
      baseConfig
    ];
in
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
    keyzox.lsp.serversPath = lib.mkOption {
      type = lib.types.path;
      default = ./servers; # fallback if not provided
      description = "Path to the directory containing per-LSP server configs.";
    };
  };

  config = lib.mkIf (config.keyzox.lsp.enabled != [ ]) {
    lsp.servers = lib.genAttrs config.keyzox.lsp.enabled generateLspConfig;
  };
}
