{
  pkgs ? import <nixpkgs> { },
  nixvim,
  liteMode ? false,
  quickMode ? true,
  inputs,
  outputs,
  self,
  home,
}:
nixvim.makeNixvimWithModule {
  inherit pkgs;
  module = import ./config;
  extraSpecialArgs = {
    inherit
      self
      liteMode
	  quickMode
      inputs
      outputs
      home
      ;
  };
}
