{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:

{
  programs.direnv = lib.mkIf config.keyzox.shell.enable {
    enable = lib.mkDefault true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    silent = true;
    package = inputs.unstablepkgs.legacyPackages.${pkgs.system}.direnv;
  };
}
