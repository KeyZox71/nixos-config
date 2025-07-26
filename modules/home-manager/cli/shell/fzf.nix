{
  lib,
  config,
  ...
}:

{
  programs.fzf = lib.mkIf config.keyzox.shell.enable {
    enable = lib.mkDefault true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = true;
  };
}
