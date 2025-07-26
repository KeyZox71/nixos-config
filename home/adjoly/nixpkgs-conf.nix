{ pkgs, inputs, ... }:

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
}
