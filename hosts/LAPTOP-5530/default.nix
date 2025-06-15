{
  pkgs,
  config,
  ...
}:

{
  imports = [
    ../home.nix

    ./disko.nix
    ./hardware-configuration.nix
  ];

  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];

  networking.hostName = "LAPTOP-5530";

  # For ddcutils compatibility
  users.users.adjoly.extraGroups = [ "i2c" ];

  keyzox = {
    defaults = true;
    wm = true;

    grub-boot.enable = true;
    theme.enable = true;

    hardware = {
      bluetooth.enable = true;
      logitech.enable = true;
      nvidia.powerManagement = true;
    };
    programs = {
      docker.enable = true;
      steam.enable = true;
    };
    services = { };
  };
  powerManagement.enable = true;
  environment.systemPackages = with pkgs; [ ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
