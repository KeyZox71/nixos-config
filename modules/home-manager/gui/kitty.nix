{
  config,
  lib,
  pkgs,
  ...
}:

{
  options = {
    keyzox.kitty.enable = lib.mkEnableOption "Can be used to enable my kitty config";
  };

  config = lib.mkIf config.keyzox.kitty.enable {
    programs.kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = lib.mkDefault true;
      environment = {
        "KITTY_ENABLE_WAYLAND" = "1";
      };
      font = {
        name = lib.mkDefault "JetBrainsMono Nerd Font Mono";
        size = lib.mkDefault 13;
      };
    };
    xdg.configFile."kitty/light-theme.auto.conf" = {
      text = ''
        	  include ${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Latte.conf
      '';
    };
    xdg.configFile."kitty/dark-theme.auto.conf" = {
      text = ''
        	  include ${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Macchiato.conf
      '';
    };
    xdg.configFile."kitty/no-preference-theme.auto.conf" = {
      text = ''
        	  include ${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Macchiato.conf
      '';
    };
  };
}
