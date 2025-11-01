{
  self,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    self.homeModules.default
    ../nixpkgs-conf.nix
  ];

  keyzox = {
    gui.enable = true;
    shell.nixos.enable = true;
    hyprland.autostart.enable = true;
    bitwarden-ssh-agent.enable = true;
    theme.enable = true;

    hypridle.enable = lib.mkForce false;
    hyprlock.enable = lib.mkForce false;
    nextcloud.enable = lib.mkForce false;
    wl-sunset.enable = lib.mkForce false;
    gui-app.enable = lib.mkForce false;
  };

  home.packages = with pkgs; [
    firefox
    discord
    gearlever
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    xfce.thunar
    (self.packages.${pkgs.system}.keyznvim.override {
      home = "/home/adjoly/";
    })
  ];

  programs.kitty.font.size = 13; # for kitty

  home.stateVersion = "25.05";
}
