{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    keyzox.programs.steam.enable = lib.mkEnableOption "to enable steam and proton";
  };

  config = lib.mkIf config.keyzox.programs.steam.enable {
    programs.steam = {
      enable = true;
      extest.enable = true;
      extraCompatPackages = with pkgs; [ proton-ge-bin ];
      protontricks = {
        enable = lib.mkDefault true;
      };
      gamescopeSession = {
        enable = lib.mkDefault true;
      };
    };
  };
}
