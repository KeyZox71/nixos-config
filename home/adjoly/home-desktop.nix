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
      zenity # for the calendar popup in the bar
      discord
      obsidian
      localsend
      gearlever # for beeper cause the one from the nixpkgs seems bugged
      hyprpaper # should be in the hyprland category
      strawberry # for itunes lib and need to test if upload to ipod works
      libreoffice
      bitwarden-desktop # nessacary for my ssh keys (can't use git otherwise)
      nextcloud-talk-desktop
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
