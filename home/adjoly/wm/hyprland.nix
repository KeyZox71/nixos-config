{ config, pkgs, ... }:

{
	imports = [
		./hyprpaper.nix
		./swaylock.nix
		./dunst.nix
		./tofi.nix
		./xdg.nix
	];
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
	#	catppuccin = {
	#		enable = true;
	#		flavor = "frappe";
	#	};
		settings = {
			general = {
				border_size = "2";
				gaps_in = "4";
				#gaps_out = "8";
				gaps_out = "8,8,8,8";
			};
			gestures.workspace_swipe = "on";
			exec-once = "hyprpaper";
			"$mod" = "ALT";
			"$win" = "SUPER";
			bind = [
				"$mod, P, exec, tofi-drun --drun=true"
				"$mod, space, exec, tofi-drun --drun=true"
				"$mod, O, exec, vivaldi"
				"CONTROLALT, delete, exec, hyprctl dispatch exit"
				"$mod, return, exec, kitty"
				"$mod, Q, killactive"
				"$win, L, exec, swaylock"
				"$win + SHIFT, S, exec, grimblast --notify copysave area \"$HOME/Nextcloud/Images/Captures d’écran/Capture d’écran $(date +%F-%H%M%S).png\""
				"CTRL_SHIFT, K, sendshortcut, CTRL, K, ^(Beeper)$"
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
			monitor = [
				"eDP-1, 1920x1080, 0x0, 1"
				"DP-3, 1920x1080, auto, 1"
			];
			workspace = [
				"1, monitor:DP-3"
				"2, monitor:eDP-1"
				"3, monitor:DP-3"
				"4, monitor:eDP-1"
				"5, monitor:DP-3"
				"6, monitor:eDP-1"
				"7, monitor:DP-3"
				"8, monitor:eDP-1"
				"9, monitor:DP-3"
				"10, monitor:eDP-1"
			];
			misc = {
				focus_on_activate = true;
				initial_workspace_tracking = "2";
			};
			animation = [
				"global, 1, 0.8, default"
			];
			input = {
				kb_layout = "us";
				kb_variant = "intl";	
				follow_mouse = "1";
				touchpad = {
					natural_scroll = "yes";
					tap-and-drag = true;
				};
				sensitivity = "0.8";
				accel_profile = "flat";
			};
		};
	};
}
