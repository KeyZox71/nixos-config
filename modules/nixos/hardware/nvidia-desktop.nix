{
  lib,
  config,
  pkgs,
  ...
}:

# TODO: finish this

{
  options = {
    keyzox.nvidia-desktop = lib.mkEnableOption "Can be used to enable the nvidia drivers for desktop";
  };

  config = lib.mkIf config.keyzox.nvidia-desktop {
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
        powerManagement = {
          enable = lib.mkDefault true;
        };
      };
    };
  };
}
