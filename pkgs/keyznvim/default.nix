{
  pkgs ? import <nixpkgs> { },
  nixvim,
}:
let
in
nixvim.makeNixvimWithModule {
  inherit pkgs;
  module = import ./config;
  extraSpecialArgs = {
  };
}
