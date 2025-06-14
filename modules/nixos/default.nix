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
    ./home-manager.nix
  ];

  options = {
  };

  config = lib.mkMerge [
  ];

}
