{
  config,
  lib,
  pkgs,
  ...
}:

let
  source = pkgs.fetchurl {
    url = "https://drive.kanel.ovh/s/kS7b2Gpip6TkyGY/download/hyprlock.png";
    sha256 = "mRpFtFyEbZjH3y501UrA/O+jhBNvtlD/6VwkCwYlITQ=";
  };
  bsky-profile = pkgs.fetchurl {
    url = "https://cdn.bsky.app/img/avatar/plain/did:plc:7g74v3wiannux6tuc5t74gln/bafkreigqkghx7qvofu7lgtlc6r3s7t5vkbni7476c2lxy3zqrtc3eupnny@jpeg";
    sha256 = "Y225OzevISn5aiBH29qzokHSx4MT7FpBRKWDR6imlXo=";
  };
in
{
  options = {
    keyzox.hyprlock.enable = lib.mkEnableOption "Can be used to enable my lock screen";
    keyzox.hyprlock.monitor = lib.mkOption {
      type = lib.types.str;
      default = "";
      example = "DP-2";
      description = "Can be used to set the main screen for the lock";
    };
  };

  config = lib.mkIf config.keyzox.hyprlock.enable {
    keyzox.hypridle.enable = true;

    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          no_fade_in = true;
          ignore_empty_input = true;
          grace = 0;
        };
        input-field = {
          monitor = [ config.keyzox.hyprlock.monitor ];
          size = "200, 50";
          position = "0, 150";
          outer_color = "rgba(0, 0, 0, 0)";
          fail_color = "rgba(237, 135, 150, 0.95)";
          fail_text = "Wrong password";
          check_color = "rgba(238, 212, 159, 0.95)";
          rounding = 10;
          font_color = "rgba(202, 211, 245, 1.0)";
          font_size = 3;
          dot_spacing = 0.3;
          dot_size = 1.0;
          inner_color = "rgba(30, 32, 48, 0.7)";
          placeholder_text = "Enter password";
          hide_input = false;
          fade_on_empty = false;
          halign = "center";
          valign = "bottom";
          font_family = "Noto Sans Regular";
          outline_thickness = 2;
        };
        background = {
          blur_passes = 1;
          blur_size = 1;
          monitor = "";
          path = "${source}";
        };
        label = [
          {
            monitor = [ config.keyzox.hyprlock.monitor ];
            font_size = 120;
            position = "0, 250";
            text = "cmd[update:1000] echo \"<span>\$(date +\"\%H:\%M\")</span>\"";
            halign = "center";
            valign = "center";
            font_family = "Noto Sans Medium";
            color = "rgba(202, 211, 245, 0.90)";
          }
          {
            monitor = [ config.keyzox.hyprlock.monitor ];
            text = "cmd[update:1000] echo -e \"$(date +\"%A, %B %d\")\"";
            position = "0, 350";
            halign = "center";
            valign = "center";
            font_family = "Noto Sans Medium";
            color = "rgba(202, 211, 245, 0.90)";
          }
          {
            monitor = [ config.keyzox.hyprlock.monitor ];
            text = "${config.home.username}'s computer";
            position = "0, 225";
            font_size = 15;
            font_family = "Noto Sans Medium";
            color = "rgba(202, 211, 245, 0.95)";
            halign = "center";
            valign = "bottom";
          }
        ];
        shape = [
          {
            monitor = [ config.keyzox.hyprlock.monitor ];
            size = "300, 350";
            position = "0, 100";
            halign = "center";
            valign = "bottom";
            color = "rgba(24, 25, 38, 0.7)";
            rounding = 10;
          }
        ];
        image = [
          {
            monitor = [ config.keyzox.hyprlock.monitor ];
            path = "${bsky-profile}";
            border_size = 0;
            position = "0, 270";
            size = 130;
            rounding = -1;
            halign = "center";
            valign = "bottom";
          }
        ];
      };
    };
  };
}
