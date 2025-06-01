{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    git.enable = lib.mkEnableOption "Can be used to enable git config";
  };
  config = lib.mkIf config.git.enable {
    programs = {
      git = {
        enable = true;
        userName = lib.mkDefault "adjoly";
        userEmail = lib.mkDefault "adamjly@proton.me";
        signing = {
          format = "ssh";
          signByDefault = lib.mkDefault true;
          key = lib.mkDefault "~/.ssh/id_git.pub";
        };
      };
    };
    services.ssh-agent = {
      enable = lib.mkDefault true;
    };
  };
}
