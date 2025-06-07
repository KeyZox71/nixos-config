{
  lib,
  config,
  ...
}:

{
  programs.fzf = lib.mkIf config.shell.enable {
    enable = lib.mkDefault true;
    enableZshIntegration = true;
    tmux.enableShellIntegration = true;
  };
}
