{
  pkgs ? import <nixpkgs> { },
  nixvim,
  liteMode ? false,
  inputs,
  outputs,
  self,
home
}:
let
in
nixvim.makeNixvimWithModule {
  inherit pkgs;
  module = import ./config;
  extraSpecialArgs = {
    inherit self liteMode inputs outputs home;
  };
}
