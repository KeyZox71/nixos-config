{
  pkgs,
  inputs,
  outputs,
  ...
}:

{
  imports = [
    ./env.nix
    ./virt.nix
    ./boot.nix
    ./fonts.nix

    ./hardware
    ./programs
    ./services

    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  security.pam.services.hyprlock = { };

  environment.variables = {
    GDK_BACKEND = "wayland";
    NIXOS_OZONE_WL = "1";
    CLUTTER_BACKEND = "wayland";
    KITTY_ENABLE_WAYLAND = "1";
    MOZ_ENABLE_WAYLAND = 1;
  };
  programs.dconf.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    zsh
    nil
    vim
    wget
    curl
    btop
    unzip
    wluma
    firefox
    bluetuith
    cifs-utils
    wl-clipboard
    brightnessctl
    inputs.zen-browser.packages.${pkgs.system}.default
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];
  programs.ssh.startAgent = true;
  programs.seahorse.enable = true;
  services.gnome.gnome-keyring.enable = true;

  users.users.adjoly = {
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "docker"
      "audio"
      "video"
      "input"
      "networkmanager"
      "wheel"
      "sudo"
    ];
  };

  catppuccin = {
    enable = true;
    flavor = "frappe";
    accent = "lavender";
  };

  home-manager = {
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs outputs; };
    users.adjoly = import ../../home/adjoly/home-lite.nix;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
