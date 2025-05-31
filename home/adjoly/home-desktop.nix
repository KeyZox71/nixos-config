{ inputs, pkgs, ... }:
{
  imports = [
    ../../pkgs/adjust-brightness
    ../../modules/home-manager

    ./cli-app.nix
    ./wm/hyprland.nix
    ./wm/monitor-desktop.nix
    ./themes/catppuccin.nix

    ./unstable-overlay.nix

    ./services/nextcloud.nix
    ./services/darkman.nix

    ./programs/pogit.nix
    ./programs/kitty.nix
    ./programs/neovim.nix
    ./programs/direnv.nix
    ./programs/fastfetch.nix
    ./programs/shell/zsh.nix

    inputs.catppuccin.homeModules.catppuccin
  ];

  gui.enable = true;

  home = {
    packages = with pkgs; [
      vlc
      slack
      # beeper
      zenity
      discord
      kittysay
      gearlever
      hyprpaper
      strawberry
      libreoffice
      nextcloud-client
    ];
    stateVersion = "24.05";
  };

  services.mpris-proxy.enable = true;
  programs.kitty.font.size = 12;

  programs.waybar.settings.bar = {
    "hyprland/workspaces" = {
      "persistent-workspaces" = {
        "DP-2" = [
          1
          2
          3
          4
          5
        ];
        "DP-1" = [
          6
          7
          8
          9
          10
        ];
      };
    };
    output = [
      "DP-2"
      "DP-1"
    ];
  };

}
