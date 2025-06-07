{
  inputs,
  pkgs,
  self,
  ...
}:
{
  imports = [
    ../../modules/home-manager

    ./cli-app.nix
    ./wm/hyprland.nix
    ./wm/monitor-desktop.nix
    ./themes/catppuccin.nix

    ./unstable-overlay.nix

    ./services/darkman.nix

    ./programs/neovim.nix
    ./programs/direnv.nix
    ./programs/fastfetch.nix
    ./programs/shell/zsh.nix
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
      # nextcloud-client
      bitwarden-desktop # nessacary for my ssh keys (can't use git otherwise)
      self.packages.${pkgs.system}.adjust-brightness # for adjusting brightness on ddc/ci screen
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

  wayland.windowManager.hyprland = {
    settings = {
      windowrule = [
        "workspace 1, class:kitty"
        "workspace 2, class:zen-beta"
        "workspace 3, class:obsidian"
        "workspace 5, class:Bitwarden"
        "workspace 8, class:Slack"
        "workspace 9, class:discord"
        "workspace 10, class:Beeper"
      ];
      exec-once = [
        "kitty"
        "zen-beta"
        "/home/adjoly/AppImages/beeper.appimage"
        "discord"
        "bitwarden"
        "localsend_app --hidden"
        "solaar -w hide --restart-on-wake-up"
      ];

    };
  };
}
