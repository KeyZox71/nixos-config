{
  config,
  lib,
  ...
}:

{
  options = {
    keyzox.hypridle.enable = lib.mkEnableOption "Can be used to enable the hypridle daemon";
    keyzox.hypridle.sleep_timeout = lib.mkOption {
      type = lib.types.int;
      default = 600;
      example = 300;
      description = "Can be used to change the time until sleep";
    };
  };

  config = lib.mkIf config.keyzox.hypridle.enable {
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
            timeout = config.keyzox.hypridle.sleep_timeout;
            on-timeout = "systemctl suspend";
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
