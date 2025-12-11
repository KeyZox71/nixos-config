{
  ...
}:

{
  imports = [
    ../home.nix

    ./hardware.nix

    ./disko.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "MINI-BOYY";

  users.users.adjoly.extraGroups = [
    "i2c"
    "vboxusers"
  ];

  keyzox = {
    defaults = true;
    wm = true;

    grub-boot.enable = true;
    theme.enable = true;

    hardware = {
      bluetooth.enable = true;
      logitech.enable = true;
    };
    programs = {
      docker.enable = true;
    };
  };
  powerManagement.enable = true;

  system.stateVersion = "24.11";
}
