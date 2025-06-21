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

  keyzox = {
    gui.enable = true;
    shell.nixos.enable = true;
    hyprland.autostart.enable = true;
    bitwarden-ssh-agent.enable = true;
    theme.enable = true;
    hypridle.sleep_timeout = 600;
    hyprlock.monitor = "eDP-1";
  };

  services.batsignal = {
		enable = true;
		extraArgs = [ "-c" "10" "-w" "30" "-f" "100" ];
  };

  programs.kitty.font.size = 12; # for kitty

  home.stateVersion = "24.05";
}
