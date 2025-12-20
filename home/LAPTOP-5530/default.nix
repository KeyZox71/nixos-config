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
    hypridle.sleep_timeout = 600;
    hyprlock.monitor = "eDP-1";
    k9s.enable = true;
  };

  services.batsignal = {
    enable = true;
    extraArgs = [
      "-c"
      "10"
      "-w"
      "30"
    ];
  };

  programs.kitty.font.size = 13.5; # for kitty

  home.stateVersion = "24.05";
}
