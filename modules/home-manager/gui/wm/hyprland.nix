{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    keyzox.hyprland.enable = lib.mkEnableOption "Can be used to enable my hyprland config";
    keyzox.hyprland.autostart.enable = lib.mkEnableOption "Can be used the enable my autostart routine";
  };

  config = lib.mkMerge [

    (lib.mkIf config.keyzox.hyprland.enable {
      keyzox.hyprpaper.enable = lib.mkDefault true;
      keyzox.tofi.enable = lib.mkDefault true;
      keyzox.waybar.enable = lib.mkDefault true;

      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        settings = {
          general = {
            border_size = "0";
            gaps_in = "4";
            gaps_out = "4,4,4,4";
            "col.active_border" = "rgba(ffbabbf1)";
            "col.inactive_border" = "rgba(ff303446)";
          };
          decoration = {
            rounding = 8;
          };
          gestures.workspace_swipe = "on";
          exec-once = lib.mkBefore [
            "hyprpaper"
            "waybar"
          ];
          "$mod" = "ALT";
          "$win" = "SUPER";
          bind = [
            "$mod, P, exec, tofi-drun --drun=true"
            "CONTROLALT, delete, exec, hyprctl dispatch exit"
            "$mod, return, exec, kitty"
            "$mod, Q, killactive"
            "$mod, F, fullscreen"
            "$win, L, exec, hyprlock"
            "$win + SHIFT, S, exec, grimblast --notify copysave area \"$HOME/Nextcloud/Images/Captures d’écran/Capture d’écran $(date +%F-%H%M%S).png\""
            "CTRL ALT, L, exec, systemctl suspend"
            ",Print,  exec, grimblast --notify copysave area \"$HOME/Nextcloud/Images/Captures d’écran/Capture d’écran $(date +%F-%H%M%S).png\""
          ]
          ++ (builtins.concatLists (
            builtins.genList (
              x:
              let
                ws =
                  let
                    c = (x + 1) / 10;
                  in
                  builtins.toString (x + 1 - (c * 10));
              in
              [
                "$mod, ${ws}, workspace, ${toString (x + 1)}"
                "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
              ]
            ) 10
          ));
          env = [
            "XCURSOR_SIZE,30"
            "XDG_CURRENT_DESKTOP,Hyprland"
            "OBSIDIAN_USE_WAYLAND=1"
          ];
          cursor = {
            no_hardware_cursors = true;
          };
          bindl = [
            # media controls
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPause, exec, playerctl pause"
            ", XF86AudioPrev, exec, playerctl previous"
            ", XF86AudioNext, exec, playerctl next"

            # volume
            ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ];

          bindle = [
            # volume
            ", XF86AudioRaiseVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%+"
            ", XF86AudioLowerVolume, exec, wpctl set-volume -l '1.0' @DEFAULT_AUDIO_SINK@ 5%-"

            # backlight
            ", XF86MonBrightnessUp, exec, brightnessctl s 5%+"
            ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
          ];
          misc = {
            focus_on_activate = true;
          };
          animation = [
            "global, 1, 0.8, default"
          ];
          input = {
            kb_layout = "us";
            kb_variant = "intl";
            follow_mouse = "1";
            scroll_factor = "0.7";
            force_no_accel = true;
            touchpad = {
              natural_scroll = "yes";
              tap-and-drag = true;
              scroll_factor = "0.5";
            };
            sensitivity = "0.7";
            accel_profile = "flat";
          };
        };
      };
    })
    (lib.mkIf config.keyzox.hyprland.autostart.enable {
      wayland.windowManager.hyprland.settings = {
        windowrule = [
          "workspace 3, class:obsidian"
          "workspace 5, class:Bitwarden"
          "workspace 8, class:Slack"
          "workspace 9, class:discord"
          "workspace 10, class:BeeperTexts"
        ];
        exec-once = [
          "/home/adjoly/AppImages/beeper.appimage -enable-features=UseOzonePlatform -ozone-platform=wayland"
          "discord"
          "bitwarden"
          "localsend_app --hidden"
          "solaar -w hide"
        ];
      };
    })
  ];
}
