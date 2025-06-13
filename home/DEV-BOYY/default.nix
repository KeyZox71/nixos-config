{
  ...
}:

{
  imports = [
    ../../modules/home-manager # import home-manager modules
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
