{
  pkgs,
  inputs,
  outputs,
  self,
  config,
  ...
}:

{
  imports = [
    ../home.nix

    ./disko.nix
    ./hardware-configuration.nix
  ];

  powerManagement.enable = true;

  security.polkit.enable = true;

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  networking = {
    hostName = "LAPTOP-5530";
  };
  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  environment.systemPackages = with pkgs; [
  ];

  users.users.adjoly.extraGroups = [
    "i2c" # TODO: see about that
  ];

  keyzox = {
    defaults = true;
    wm = true;

    grub-boot.enable = true;
    hardware = {
      bluetooth.enable = true;
      logitech.enable = true;
      nvidia.powerManagement = true;
    };

    services = {
      ddcutils.enable = true;
    };
    programs = {
      docker.enable = true;
      steam.enable = true;
    };
    theme.enable = true;
  };

  programs.steam.gamescopeSession.enable = false;
  programs.steam.protontricks.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
