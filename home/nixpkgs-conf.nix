{
  pkgs,
  inputs,
  self,
  ...
}:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
    overlays = [
      (final: prev: {
        unstable = import inputs.unstablepkgs {
          system = pkgs.system;
          config.allowUnfree = true;
        };
      })
    ];
  };
  home.packages = [
    (self.packages.${pkgs.system}.keyznvim.override {
      home = "/home/adjoly/";
    })
  ];
}
