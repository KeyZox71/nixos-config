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
  };

  services.ssh-agent.enable = false;

  home.stateVersion = "25.05";
}
