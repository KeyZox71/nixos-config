{
  lib,
  pkgs,
  config,
  ...
}:

{
  options = {
    keyzox.theme.enable = lib.mkEnableOption "Can be used the enable catppuccin :D";
  };

  config = lib.mkIf config.keyzox.theme.enable {
    catppuccin = {
      enable = true;
      flavor = "macchiato";
      accent = "lavender";
      cursors = {
        enable = lib.mkDefault true;
        accent = "lavender";
        flavor = "macchiato";
      };
      btop = {
        enable = lib.mkDefault false;
      };
      gh-dash.enable = lib.mkDefault true;
      kitty.enable = lib.mkDefault false;
      tofi.enable = lib.mkDefault false;
      fzf.enable = lib.mkDefault true;
      hyprlock.enable = lib.mkDefault false;
      starship.enable = lib.mkDefault false;
      waybar.enable = lib.mkDefault true;
    };
  };
}
