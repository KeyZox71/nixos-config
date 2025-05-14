{ ... }:

{
	wayland.windowManager.hyprland = {
		settings = {
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
		};
	};

}
