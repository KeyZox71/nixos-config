{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    keyzox.programs.docker.enable = lib.mkEnableOption "to enable docker and docker-compose";
    keyzox.programs.docker.rootless = lib.mkEnableOption "to enable rootless for docker";
  };

  config = lib.mkMerge [
    (lib.mkIf config.keyzox.programs.docker.enable {
      virtualisation.docker = {
        enable = true;
      };

      environment.systemPackages = with pkgs; [
        docker-compose
      ];
    })
    (lib.mkIf config.keyzox.programs.docker.rootless {
      virtualisation.docker.rootless = {
        enable = true;
		setSocketVariable = true;
      };
    })
  ];
}
