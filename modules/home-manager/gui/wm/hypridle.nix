{
	config,
	lib,
	pkgs,
	...
}:

{
	options = {
		hypridle.enable = lib.mkEnableOption "Can be used to enable the hypridle daemon";
	};

	config = lib.mkIf config.hypridle.enable {
		services.hypridle = {
			enable = true;
			settings = {
				general = {
					lock_cmd = "pidof hyprlock || hyprlock";
					before_sleep_cmd = "loginctl lock-session";
					after_sleep_cmd = "hyprctl dispatch dpms on";
				};
				listener = [
					{
						timeout = 300;
						on-timeout = "systemctl suspend";
					}
					{
						timeout = 280;
						on-timeout = "dunstify suspending in 20sec";
					}
					{
						timeout = 180;
						on-timeout = "hyprctl dispatch dpms off";
						on-resume = "hyprctl dispatch dpms on";
					}
				];
			};
		};
	};
}
