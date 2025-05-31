{ config, lib, pkgs, ...}:

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
      };
    };
  };
}
