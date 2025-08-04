{
  pkgs ? import <nixpkgs> { },
  nixvim,
  liteMode ? false,
}:
let
in
nixvim.makeNixvimWithModule {
  inherit pkgs;
  module = import ./config;
  extraSpecialArgs = {
    inherit liteMode;
  };
}
