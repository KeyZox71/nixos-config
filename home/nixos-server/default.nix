{
  self,
  pkgs,
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

  home.packages = [
    (self.packages.${pkgs.system}.keyznvim.override {
      quickMode = false;
      home = "/home/adjoly/";
    })
  ];

  home.stateVersion = "25.05";
}
