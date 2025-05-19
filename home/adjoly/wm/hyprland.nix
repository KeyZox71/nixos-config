{ config, pkgs, ... }:

{
	imports = [
		./tofi.nix
		./dunst.nix
		./waybar.nix
		#./swaylock.nix
		./hyprlock.nix
		./hyprpaper.nix
		#		./xdg.nix
	];
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		settings = {
			general = {
				border_size = "0";
				gaps_in = "4";
				gaps_out = "8,8,8,8";
				"col.active_border" = "#ffbabbf1";
				"col.inactive_border" = "#ff303446";
			};
			decoration = {
				rounding = 8;
			};
			gestures.workspace_swipe = "on";
			exec-once = [
				"hyprpaper"
				"waybar"
			];
			"$mod" = "ALT";
			"$win" = "SUPER";
			bind = [
				"$mod, P, exec, tofi-drun --drun=true"
				"$mod, space, exec, tofi-drun --drun=true"
				"CONTROLALT, delete, exec, hyprctl dispatch exit"
				"$mod, return, exec, kitty"
				"$mod, Q, killactive"
				"$win, L, exec, hyprlock"
				"$win + SHIFT, S, exec, grimblast --notify copysave area \"$HOME/Nextcloud/Images/Captures d’écran/Capture d’écran $(date +%F-%H%M%S).png\""
				"CTRL_SHIFT, K, sendshortcut, CTRL, K, ^(Beeper)$"
				"CTRL ALT, HOME, exec, adjust-brightness 1 +10"
				"CTRL ALT, END, exec, adjust-brightness 1 -10"
				"CTRL ALT, Next, exec, adjust-brightness 2 -10"
				"CTRL ALT, Prior, exec, adjust-brightness 2 +10"
			]
			++ (
				builtins.concatLists (builtins.genList (
					x: let
						ws = let
							c = (x + 1) / 10;
						in
							builtins.toString (x + 1 - (c * 10));
					in [
						"$mod, ${ws}, workspace, ${toString (x + 1)}"
						"$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
					]
				)
				10)
			);
			env = [
				"XCURSOR_SIZE,30"
				"XDG_CURRENT_DESKTOP,Hyprland"
			];
			cursor = {
				no_hardware_cursors = true;
			};
			bindl = [
			# media controls
				", XF86AudioPlay, exec, playerctl play-pause"
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
				sensitivity = "0.6";
				accel_profile = "flat";
			};
		};
	};
}
