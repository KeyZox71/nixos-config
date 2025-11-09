{
  ...
}:

{
  programs.waybar.settings.bar = {
    "hyprland/workspaces" = {
    };
    output = [
      "DP-2"
      "DP-1"
    ];
  };

  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        "CTRL ALT, HOME, exec, adjust-brightness 1 +10"
        "CTRL ALT, END, exec, adjust-brightness 1 -10"
        "CTRL ALT, Next, exec, adjust-brightness 2 -10"
        "CTRL ALT, Prior, exec, adjust-brightness 2 +10"
      ];
      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];
      monitor = [
        "DP-2, 1920x1080@75, 0x0, 1"
        "DP-1, 1920x1080@75, -1080x0, 1, transform, 1"
      ];
      workspace = [
        "1, monitor:DP-2"
        "2, monitor:DP-2"
        "3, monitor:DP-2"
        "4, monitor:DP-2"
        "5, monitor:DP-2"
        "6, monitor:DP-1"
        "7, monitor:DP-1"
        "8, monitor:DP-1"
        "9, monitor:DP-1"
        "10, monitor:DP-1"
      ];

    };
  };
}
