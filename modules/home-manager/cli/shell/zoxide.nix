{
  lib,
  config,
  ...
}:

{
  programs.zoxide = lib.mkIf config.shell.enable {
    enable = lib.mkDefault true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
}
