{
  pkgs,
  inputs,
  outputs,
  self,
  ...
}:

{
  imports = [
    ./env.nix
    ./boot.nix
    ./fonts.nix
    ./hardware
    ./services
    ./programs

    inputs.home-manager.nixosModules.home-manager
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  powerManagement.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  qt = {
    enable = true;
    platformTheme = "qt5ct";
  };

  security.polkit.enable = true;
  security.pam.services.hyprlock = { };

  environment.variables = {
    QT_STYLE_OVERRIDE = "Fusion";
    QT_QPA_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
    NIXOS_OZONE_WL = "1";
    CLUTTER_BACKEND = "wayland";
    KITTY_ENABLE_WAYLAND = "1";
    MOZ_ENABLE_WAYLAND = 1;
  };
  programs.dconf.enable = true;

  nix = {
    settings = {
      trusted-users = [
        "adjoly"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
  };

  programs.zsh.enable = true;
  #  programs.fish.enable = true;
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 3d";
    };
    flake = "/home/adjoly/nixos-config";
  };

  environment.systemPackages = with pkgs; [
    git
    nil
    vim
    wget
    curl
    btop
    ddcui
    sbctl
    unzip
    ddcutil
    #chiaki-ng
    bluetuith
    cifs-utils
    brightnessctl
    wl-clipboard
    docker-compose
    inputs.nh.packages.${pkgs.system}.default
  ];

  hardware.i2c.enable = true;
  hardware.logitech = {
    wireless = {
      enable = true;
      enableGraphical = true;
    };
  };
  services.udev.packages = with pkgs; [
    ddcutil
  ];

  # programs.ssh.startAgent = false;
  programs.seahorse.enable = true;
  services.gnome.gnome-keyring.enable = true;

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  users.users.adjoly = {
    shell = pkgs.zsh;
    isNormalUser = true;
    initialPassword = "kanelthego@t";
    extraGroups = [
      "docker"
      "audio"
      "video"
      "input"
      "networkmanager"
      "wheel"
      "sudo"
      "i2c"
      "vboxusers"
    ];
  };
  users.groups.i2c = { };
  virtualisation.docker.enable = true;
  services.udev.extraRules = ''
    KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
  '';

  catppuccin = {
    enable = true;
    flavor = "frappe";
    accent = "lavender";
  };

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs self; };
    users.adjoly = import ../../home/LAPTOP-5530;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
