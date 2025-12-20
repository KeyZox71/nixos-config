{
  pkgs,
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

  # boot.kernelModules = [ "iwlwifi" ];
  # boot.extraModprobeConfig = "options iwlwifi power_save=0 swcrypto=1";

  # networking.networkmanager.powerManagement = false;
  boot.kernelModules = [ "iwlwifi" ];
  boot.extraModprobeConfig = "options iwlwifi power_save=0 11n_disable=1";

  networking.hosts = {
    "192.168.56.110" = [
      "app1.com"
      "app2.com"
      "app3.com"
    ];
  };

  users.users.adjoly.extraGroups = [
    "i2c"
    "vboxusers"
  ];
  boot = {
    blacklistedKernelModules = [
      "kvm"
      "kvm_intel"
      "kvm_amd"
    ];
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  };

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
  environment.systemPackages = with pkgs; [
    wireshark
  ];
  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.daemon.settings.features.cdi = true;
  hardware.nvidia-container-toolkit.enable = true;

  programs.wireshark.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
