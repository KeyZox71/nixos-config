{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    keyzox.programs.nh.enable = lib.mkEnableOption "to enable nh (nix helper)";
  };

  config = lib.mkIf config.keyzox.programs.nh.enable {
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = lib.mkDefault "--keep 5 --keep-since 3d";
      };
      flake = lib.mkDefault "/home/adjoly/nixos-config";
    };
  };
}
