{ lib, config, ... }:

{
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
  ];

  hardware.nvidia = {
    powerManagement = {
      enable = true;
      finegrained = true;
    };
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
}
