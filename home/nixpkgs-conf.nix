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
      (_: _: {
        unstable = import inputs.unstablepkgs {
          system = pkgs.system;
          config.allowUnfree = true;
        };
      })
    ];
  };
}
