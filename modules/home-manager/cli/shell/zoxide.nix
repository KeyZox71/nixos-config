{
  lib,
  config,
  ...
}:

{
  programs.zoxide = lib.mkIf config.keyzox.shell.enable {
    enable = lib.mkDefault true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
}
