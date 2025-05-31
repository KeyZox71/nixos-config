{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
    # config = {
    #   preferred = {
    #     default = [
    #       "hyprland"
    #     ];
    #   };
    # };
  };
  programs.hyprland = {
    enable = true;
    #		withUWSM = true;
  };
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
}
