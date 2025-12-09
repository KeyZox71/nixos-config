{
  pkgs,
  ...
}:

{
  imports = [
    ../home.nix

    ./boot.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "DEV-BOYY";

  # For ddcutils compatibility
  users.users.adjoly.extraGroups = [ "i2c" ];

  keyzox = {
    defaults = true;
    wm = true;

    theme.enable = true;

    hardware = {
      bluetooth.enable = true;
      logitech.enable = true;
      nvidia.enable = true;
    };
    programs = {
      docker.enable = true;
      # steam.enable = true;
    };
    services = { };
  };
  powerManagement.enable = true;
  hardware.nvidia.powerManagement.enable = true;

  environment.systemPackages = with pkgs; [
    wlr-randr
    cifs-utils
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
