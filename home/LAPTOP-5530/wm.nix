{
  ...
}:

{
  programs.waybar.settings.bar = {
    "hyprland/workspaces" = {
    };
    output = [
      "eDP-1"
      "DP-3"
    ];
  };

  wayland.windowManager.hyprland = {
    settings = {
      gesture = [
        "3, horizontal, workspace"
      ];
      monitor = [
        "eDP-1, 1920x1080@60, 0x0, 1.25"
        "DP-3, 1920x1080@60, auto-up, 1"
      ];
      workspace = [
        "1, monitor:DP-3"
        "2, monitor:DP-3"
        "3, monitor:DP-3"
        "4, monitor:DP-3"
        "5, monitor:DP-3"
        "6, monitor:eDP-1"
        "7, monitor:eDP-1"
        "8, monitor:eDP-1"
        "9, monitor:eDP-1"
        "10, monitor:eDP-1"
      ];

    };
  };
}
