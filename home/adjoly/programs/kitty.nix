{ pkgs, lib, ... }:
{
  programs.kitty = {
    enable = true;
	package = pkgs.unstable.kitty;

    shellIntegration.enableZshIntegration = true;

    environment = {
      "KITTY_ENABLE_WAYLAND" = "1";
    };

    font = {
      name = lib.mkDefault "JetBrainsMono Nerd Font Mono";
      size = lib.mkDefault 13;
    };
  };
  xdg.configFile."kitty/light-theme.auto.conf".source = "${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Latte.conf";
  xdg.configFile."kitty/dark-theme.auto.conf".source = "${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Frappe.conf";
  xdg.configFile."kitty/no-preference-theme.auto.conf".source = "${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Frappe.conf";
}
