{
  self,
  ...
}:

{
  imports = [
    self.homeModules.default
    ../adjoly/nixpkgs-conf.nix

    ./packages.nix
    ./wm.nix
  ];

  gui.enable = true;
  shell.nixos.enable = true;
  hyprland.autostart.enable = true;
  bitwarden-ssh-agent.enable = true;
  theme.enable = true;

  programs.kitty.font.size = 13; # for kitty

  home.stateVersion = "24.05";
}
