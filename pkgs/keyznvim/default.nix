{
  pkgs ? import <nixpkgs> { },
  nixvim,
  liteMode ? false,
  inputs,
  outputs,
  self,
}:
let
in
nixvim.makeNixvimWithModule {
  inherit pkgs;
  module = import ./config;
  extraSpecialArgs = {
    inherit self liteMode inputs outputs;
  };
}
