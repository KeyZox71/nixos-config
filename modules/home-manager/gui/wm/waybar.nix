{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    keyzox.waybar.enable = lib.mkEnableOption "Can be used to enable my waybar config";
  };

  config = lib.mkIf config.keyzox.waybar.enable {
    services.mpris-proxy.enable = true;

    home.packages = with pkgs; [
      wiremix # for the pipewire tui
      zenity # for the calendar popup in the bar
    ];

    programs.waybar = {
      enable = true;
      settings = {
        bar = {
          margin-top = 4;
          margin-bottom = 0;
          margin-right = 4;
          margin-left = 4;
          layer = "overlay";
          exclusive = false;
          modules-left = [
            "hyprland/workspaces"
            "hyprland/window"
          ];
          modules-center = [ "clock" ];
          modules-right = [
            "mpris"
            "tray"
            "pulseaudio"
            "custom/prev"
            "custom/playpause"
            "custom/next"
            "network"
            "battery"
          ];

          # ---------------------------------------------------------

          "hyprland/workspaces" = {
            format = "{icon}";
            tooltip = false;
            format-icons = {
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "6" = "6";
              "7" = "7";
              "8" = "8";
              "9" = "9";
              "10" = "10";
              "active" = "";
            };
          };

          "hyprland/window" = {
            format = "{title}";
            tooltip = false;
            icon = true;
            icon-size = 16;
            max-length = 20;
          };

          # -------------------------:--------------------------------

          clock = {
            format = "{:%a %d %b | %H : %M}";
            tooltip = false;
            on-click = "GSK_RENDERER=gl zenity --calendar";
          };

          # ---------------------------------------------------------

          "custom/next" = {
            format = "󰒭";
            on-click = "playerctl next";
            tooltip = false;
          };
          "custom/playpause" = {
            format = "󰐊";
            on-click = "playerctl play-pause";
            tooltip = false;
          };
          "custom/prev" = {
            format = "󰒮";
            on-click = "playerctl previous";
            tooltip = false;
          };
          pulseaudio = {
            format = "{icon} {volume:2}%";
            format-bluetooth = "{icon} {volume}% ";
            format-muted = "MUTE {volume:2}%";
            format-icons = {
              headphones = "";
              default = [
                ""
                ""
              ];
            };
            reverse-mouse-scrolling = true;
            on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
            on-click-middle = "kitty -- wiremix";
            tooltip = false;
          };
          mpris = {
            format = "{dynamic}";
            format-paused = " {dynamic}";
            title-len = 20;
            dynamic-len = 20;
            dynamic-order = [ "title" ];
            tooltip = false;
          };
          tray = {
            icon-size = 16;
          };
          network = {
            format = "{ifname}";
            format-wifi = "{essid}";
            format-ethernet = "ethernet";
            format-disconnected = "no network";
            on-click = "kitty -- nmtui";
            on-click-right = "kitty -- bluetuith";
            tooltip = false;
          };
          battery = {
            format = "{icon} {capacity} %";
            format-icons = [
              "󰂎"
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            format-charging = "󰂄 {capacity} %";
            tooltip = false;
            states = {
              warning = 30;
              critical = 15;
            };
            on-click-right = "systemctl suspend";
          };
        };
      };

      style = ''
        * {
          all: unset;
          font-family: "JetBrainsMono Nerd Font Mono";
          font-size: 14px;
        }

        window#waybar {
          background: @mantle;
          border: 2px solid transparent;
          border-radius: 10px;
        }
        window#waybar.empty #window {
          background-color: transparent;
          border: transparent;
        }

        #mpris, #battery, #network, #clock, #pulseaudio, #window, #tray, #tray menu {
          color: @text;
          margin: 6px 4px;
          background-color: @base;
          border: 2px solid transparent;
        }

        #workspaces {
          margin-left: 8px;
          margin: 6px 4px;
          padding: 2px 8px;
          border-radius: 8px;
          background-color: @base;
          border: 2px solid transparent;
        }
        .modules-left #workspaces {
          padding: 2px 8px;
          margin-left: 8px;
        }
        .modules-left #workspaces button {
          color: @text;
          padding: 0px 4px;
          border-bottom: 0px solid transparent;
        }
        .modules-left #workspaces button.empty {
          color: @surface0;
          border-bottom: 0px solid transparent;
        }
        .modules-left #workspaces button.active,
        .modules-left #workspaces button.focused {
          border-bottom: 0px solid transparent;
        }

        #custom-prev {
          border-radius: 8px 0px 0px 8px;
          padding: 2px 8px;
          margin: 6px 4px;
          border: 2px solid transparent;
          margin-right: 0px;
          border-right: 0px;
          background-color: @base;
          color: @text;
        }
        #custom-next {
          border-radius: 0px 8px 8px 0px;
          color: @text;
          padding: 2px 8px;
          margin: 6px 4px;
          border: 2px solid transparent;
          margin-left: 0px;
          border-left: 0px;
          background-color: @base;
        }
        #custom-playpause {
          color: @text;
          border-radius: 0px 0px 0px 0px;
          padding: 2px 8px;
          margin: 6px 4px;
          border: 2px solid transparent;
          margin-right: 0px;
          border-right: 0px;
          margin-left: 0px;
          border-left: 0px;
          background-color: @base;
        }

        #network.disconnected {
          color: @mauve;
        }
        #network.ethernet {
          color: @text;
        }
        #network.wifi {
          color: @text;
        }

        #battery {
          margin-right: 8px;
        }
        #battery.charging, #battery.plugged {
          color: @lavender;
        }
        #battery.critical:not(.charging) {
          color: @red;
        }
        #battery.warning:not(.charging) {
          color: @peach;
        }
        		'';
    };
  };
}
