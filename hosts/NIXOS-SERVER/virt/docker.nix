{ pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
    storageDriver = "btrfs";
    daemon.settings = {
      runtimes.nvidia = {
        path = "nvidia-container-runtime";
        runtimeArgs = [ ];
      };
    };
  };
  environment.systemPackages = with pkgs; [
    docker-compose
    nvidia-container-toolkit
    runc
  ];
  hardware.nvidia-container-toolkit.enable = true;
  environment.variables = {
    NVIDIA_DRIVER_CAPABILITIES = "compute,utility,video";
    NVIDIA_VISIBLE_DEVICES = "all";
  };
}
