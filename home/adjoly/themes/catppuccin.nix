{ lib, ... }:
{
  catppuccin = {
    enable = lib.mkDefault true;
    flavor = "frappe";
    accent = "lavender";
    cursors = {
      enable = lib.mkDefault true;
      accent = "lavender";
      flavor = "frappe";
    };
    btop = {
      enable = lib.mkDefault true;
      flavor = lib.mkDefault "frappe";
    };

    tmux.enable = lib.mkDefault true;
    kitty.enable = lib.mkDefault false;
    tofi.enable = lib.mkDefault true;
    fzf.enable = lib.mkDefault true;
    hyprlock.enable = lib.mkDefault false;
    starship.enable = lib.mkDefault false;
    waybar.enable = lib.mkDefault true;
  };
}
