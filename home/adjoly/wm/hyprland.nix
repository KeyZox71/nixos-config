{ config, pkgs, ... }:

{
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		settings = {
			"$mod" = "ALT";
			bind = [
				"$mod, B, exec, vivaldi"
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
			input = {
				kb_layout = "us";
				kb_variant = "intl";
				
				follow_mouse = "1";

				touchpad.natural_scroll = "no";
				
				sensitivity = "0";
				accel_profile = "flat";
			};
		};
	};
}
