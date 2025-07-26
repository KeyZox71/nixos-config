{
  lib,
  config,
  ...
}:

{
  programs.direnv = lib.mkIf config.keyzox.shell.enable {
    enable = lib.mkDefault true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    silent = true;
  };
}
