{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
let
in
{
  imports = [

    ./catppuccin.nix
		inputs.home-manager.nixosModules.home-mananger
  ];

  options = {
  };

  config = lib.mkMerge [
  ];

}
