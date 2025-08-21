{
  self,
  ...
}:
{
  imports = [
    self.homeModules.default
    ../nixpkgs-conf.nix
  ];

  keyzox = {
    cli.enable = true;
    shell.nixos.enable = true;
    theme.enable = true;
    hypridle.sleep_timeout = 600;
    hyprlock.monitor = "eDP-1";
  };

  services.ssh-agent.enable = false;

  home.stateVersion = "25.05";
}
