{
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
  ];

  networking.hostName = "MINI-BOYY";

  # For ddcutils compatibility
  users.users.adjoly.extraGroups = [
    "i2c"
    "vboxusers"
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "broadcom-sta-6.30.223.271-59-6.12.59"
  ];

  boot = {
    kernelModules = [
      "kvm-intel"
      "wl"
      "applesmc"
    ];
    blacklistedKernelModules = [
      "b43"
      "bcma"
    ];
    extraModulePackages = [
      # install broadcom driver for macos wifi
      config.boot.kernelPackages.broadcom_sta
    ];
  };

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
    services = {
      plymouth.enable = true;
    };
  };
  powerManagement.enable = true;
  # environment.systemPackages = with pkgs; [
  # ];

  programs.wireshark.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
