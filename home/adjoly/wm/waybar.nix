{ ... }:

{
	programs.waybar = {
		enable = true;
		catppuccin.enable = true;
		settings = {
			bar = {
				margin-top = 8;
				margin-bottom = 0;
				margin-right = 8;
				margin-left = 8;
				layer = "top";
				modules-left = [ "hyprland/workspaces" "hyprland/window" ];
				modules-center = [ "clock" ];
				modules-right = [ "mpris" "pulseaudio" "custom/prev" "custom/playpause" "custom/next" "network" "battery" ];
				output = [ "eDP-1" ];

				# ---------------------------------------------------------

				"hyprland/workspaces" = {
					format = "{icon}";
					tooltip = false;
					"persistent-workspaces" = {
						"eDP-1" = [ 1 2 3 4 5 6 7 8 9 10 ];
					};
					format-icons = {
						"1" = "◆";
						"2" = "◆";
						"3" = "◆";
						"4" = "◆";
						"5" = "◆";
						"6" = "◆";
						"7" = "◆";
						"8" = "◆";
						"9" = "◆";
						"10" = "◆";
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
					on-click = "zenity --calendar";
				};

				# ---------------------------------------------------------

				"custom/next" = {
					format =  "󰒭";
					on-click = "playerctl next";
					tooltip = false;
				};
				"custom/playpause" = {
					format =  "󰐊";
					on-click = "playerctl play-pause";
					tooltip = false;
				};
				"custom/prev" = {
					format =  "󰒮";
					on-click = "playerctl previous";
					tooltip = false;
				};
				pulseaudio = {
					format = "{icon} {volume:2}%";
					format-bluetooth = "{icon} {volume}% ";
					format-muted = "MUTE {volume:2}%";
					format-icons = {
						headphones = "";
						default = [ "" "" ];
					};
					reverse-mouse-scrolling = true;
					on-click = "wpctl set-mute @DEFAULT_SINK@ toggle";
					tooltip = false;
				};
				mpris = {
					format = "{dynamic}";
					format-paused = " {dynamic}";
					title-len = 50;
					dynamic-len = 50;
					dynamic-order = [ "title" ];
					tooltip = false;
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
					format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
					format-charging = "󰂄 {capacity} %";
					tooltip = false;
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
  background: #292c3c;
  border: 2px solid transparent;
  border-radius: 10px;
}
window#waybar.empty #window {
  background-color: transparent;
  border: transparent;
}

#mpris, #battery, #network, #clock, #pulseaudio, #window {
  color: #c6d0f5;
  margin: 6px 4px;
  padding: 2px 8px;
  border-radius: 8px;
  background-color: #303446;
  border: 2px solid transparent;
}

#workspaces {
  margin-left: 8px;
  margin: 6px 4px;
  padding: 2px 8px;
  border-radius: 8px;
  background-color: #303446;
  border: 2px solid transparent;
}
.modules-left #workspaces {
  padding: 2px 8px;
  margin-left: 8px;
}
.modules-left #workspaces button {
  color: #c6d0f5;
  padding: 0px 4px;
  border-bottom: 0px solid transparent;
}
.modules-left #workspaces button.empty {
  color: #414559;
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
  background-color: #303446;
  color: #c6d0f5;
}
#custom-next {
  border-radius: 0px 8px 8px 0px;
  color: #c6d0f5;
  padding: 2px 8px;
  margin: 6px 4px;
  border: 2px solid transparent;
  margin-left: 0px;
  border-left: 0px;
  background-color: #303446;
}
#custom-playpause {
  color: #c6d0f5;
  border-radius: 0px 0px 0px 0px;
  padding: 2px 8px;
  margin: 6px 4px;
  border: 2px solid transparent;
  margin-right: 0px;
  border-right: 0px;
  margin-left: 0px;
  border-left: 0px;
  background-color: #303446;
}

#network.disconnected {
  color: #ca9ee6
}
#network.ethernet {
  color: #c6d0f5;
}
#network.wifi {
  color: #c6d0f5;
}

#battery {
  margin-right: 8px;
}
#battery.charging, #battery.plugged {
  color: #babbf1;
}
#battery.critical:not(.charging) {
  color: #e78284;
}
		'';
	};
}
