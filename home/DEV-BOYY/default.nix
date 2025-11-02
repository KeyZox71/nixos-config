{
  self,
  ...
}:

{
  imports = [
    self.homeModules.default
    ../nixpkgs-conf.nix

    ./packages.nix
    ./wm.nix
  ];

  keyzox = {
    gui.enable = true;
    shell.nixos.enable = true;
    hyprland.autostart.enable = true;
    bitwarden-ssh-agent.enable = true;
    theme.enable = true;
    hypridle.sleep_timeout = -1;
    hyprlock.monitor = "DP-2";
  };

  programs.kitty.font.size = 13; # for kitty

  home.stateVersion = "24.05";
}
