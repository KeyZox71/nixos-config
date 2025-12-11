{
  ...
}:

{
  programs.waybar.settings.bar = {
    "hyprland/workspaces" = {
    };
    output = [
      "HDMI-A-3"
    ];
  };

  wayland.windowManager.hyprland = {
    settings = {
      bind = [
      ];
      env = [
      ];
      monitor = [
        "HDMI-A-3, 1920x1080@60, 0x0, 1"
      ];
      workspace = [
        "1, monitor:HDMI-A-3"
        "2, monitor:HDMI-A-3"
        "3, monitor:HDMI-A-3"
        "4, monitor:HDMI-A-3"
        "5, monitor:HDMI-A-3"
        "6, monitor:HDMI-A-3"
        "7, monitor:HDMI-A-3"
        "8, monitor:HDMI-A-3"
        "9, monitor:HDMI-A-3"
        "10, monitor:HDMI-A-3"
      ];

    };
  };
}
