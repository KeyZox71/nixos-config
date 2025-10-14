{
  lib,
  config,
  ...
}:

let
  activate = lib.mkIf config.keyzox.hardware.nvidia.enable {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };

      nvidia = {
        modesetting = {
          enable = lib.mkDefault true;
        };
        nvidiaSettings = lib.mkDefault true;
        open = lib.mkDefault false;
      };
    };
  };

  powerManage = lib.mkIf config.keyzox.hardware.nvidia.powerManagement {
    hardware.nvidia.powerManagement = {
      enable = lib.mkDefault true;
      finegrained = lib.mkDefault true;
    };
  };
in
{
  options = {
    keyzox.hardware.nvidia.enable = lib.mkEnableOption "Can be used to enable the nvidia drivers";
    keyzox.hardware.nvidia.powerManagement = lib.mkEnableOption "Can be used to enable the powerManagement options for nvidia driver";
  };

  config = lib.mkMerge [
    powerManage
    activate
  ];
}
