{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
  auto-theme = lib.mkIf config.keyzox.theme.auto {
    programs.dconf.enable = true;
  };
  wm = lib.mkIf config.keyzox.wm {
    keyzox = {
      fonts = true;

      theme.auto = true;
      programs = {
        hyprland.enable = true;
        app-image.enable = true;
        gnome-keyring.enable = true;
      };
      services = {
        gdm.enable = true;
        xserver.enable = true;
        sound.enable = true;
        ddcutils.enable = true;
      };
    };
  };
  boot = lib.mkIf config.keyzox.boot {
    boot = {
      loader.efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      supportedFilesystems = [ "ntfs" ];
      blacklistedKernelModules = [
        "nouveau"
      ];
    };
  };
  env = lib.mkIf config.keyzox.env {
    time.timeZone = lib.mkDefault "Europe/Paris";
    console.keyMap = lib.mkDefault "us-acentos";

    i18n.defaultLocale = "fr_FR.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };
  defaults = lib.mkIf config.keyzox.defaults {
    keyzox = {
      env = lib.mkDefault true;
      boot = lib.mkDefault true;
      programs = {
        nh.enable = lib.mkDefault true;
      };
      services = {
        tailscale.enable = lib.mkDefault true;
        plymouth.enable = lib.mkDefault true;
      };
    };

    nixpkgs = {
      config = {
        allowUnfree = lib.mkDefault true;
      };
    };
    nix = {
      settings = {
        trusted-users = [
          "@wheel"
        ];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
    };

    environment.systemPackages = with pkgs; [
      git
      vim
      wget
      curl
      btop
      unzip
      wireguard-tools
    ];

    networking = {
      wireguard.enable = true;
      networkmanager.enable = lib.mkDefault true;
      firewall = {
        enable = lib.mkDefault false;
      };
    };
  };
in
{
  imports = [
    ./catppuccin.nix
    ./grub-boot.nix
    ./fonts.nix

    ./hardware
    ./services
    ./programs

    inputs.home-manager.nixosModules.home-manager
  ];

  options = {
    keyzox.env = lib.mkEnableOption "to enable all env (language and locales)";
    keyzox.boot = lib.mkEnableOption "to enable default boot options";
    keyzox.wm = lib.mkEnableOption "to enable my window manager configs";
    keyzox.theme.auto = lib.mkEnableOption "to enable wath will be used for auto dark mode";

    keyzox.defaults = lib.mkEnableOption "to enable default config (cli or not)";
  };

  config = lib.mkMerge [
    defaults
    env
    boot
    wm
    auto-theme
  ];
}
