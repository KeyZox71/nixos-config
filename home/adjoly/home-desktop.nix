{ inputs, pkgs, ... }:
{
  imports = [
    ./gtk.nix
    ./cli-app.nix
    ./wm/hyprland.nix
    ./wm/monitor-desktop.nix
    ./themes/catppuccin.nix

    ./unstable-overlay.nix

    ./services/nextcloud.nix
    ./services/darkman.nix

    ./programs/git.nix
    ./programs/tmux.nix
    ./programs/pogit.nix
    ./programs/kitty.nix
    ./programs/neovim.nix
    ./programs/direnv.nix
    ./programs/fastfetch.nix
    ./programs/shell/zsh.nix

    inputs.catppuccin.homeModules.catppuccin
  ];

  home = {
    packages = with pkgs; [
      vlc
      #beeper
      zenity
      molotov
      discord
      obsidian
      gearlever
      hyprpaper
      parsec-bin
      libreoffice
      tradingview
      qbittorrent
      rquickshare
      nextcloud-client
    ];
    stateVersion = "24.05";
  };

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
