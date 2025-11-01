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
    nix-direnv = {
      enable = true;
      package = inputs.unstablepkgs.legacyPackages.${pkgs.system}.nix-direnv;
    };
    silent = true;
    package = inputs.unstablepkgs.legacyPackages.${pkgs.system}.direnv;
  };
}
