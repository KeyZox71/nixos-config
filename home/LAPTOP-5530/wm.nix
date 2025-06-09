{
  ...
}:

{
  programs.waybar.settings.bar = {
    "hyprland/workspaces" = {
      "persistent-workspaces" = {
        "eDP-1" = [
          1
          2
          3
          4
          5
        ];
        "DP-3" = [
          6
          7
          8
          9
          10
        ];
      };
    };
    output = [
      "eDP-1"
      "DP-3"
    ];
  };

  wayland.windowManager.hyprland = {
    settings = {
      bind = [
      ];
      env = [
      ];
      monitor = [
        "eDP-1, 1920x1080, 0x0, 1"
        "DP-3, 1920x1080, auto, 1"
      ];
      workspace = [
        "1, monitor:eDP-1"
        "2, monitor:eDP-1"
        "3, monitor:eDP-1"
        "4, monitor:eDP-1"
        "5, monitor:eDP-1"
        "6, monitor:DP-3"
        "7, monitor:DP-3"
        "8, monitor:DP-3"
        "9, monitor:DP-3"
        "10, monitor:DP-3"
      ];

    };
  };
}
